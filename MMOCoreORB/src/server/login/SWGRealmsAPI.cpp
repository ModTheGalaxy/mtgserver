/*
                Copyright <SWGEmu>
        See file COPYING for copying conditions.*/

/**
 * @author      : lordkator (lordkator@swgemu.com)
 * @file        : SWGRealmsAPI.cpp
 * @created     : Fri Nov 29 10:04:14 UTC 2019
 */

#ifdef WITH_SWGREALMS_API

#define SWGREALMS_API_VERSION 1004

#include "SWGRealmsAPI.h"

#include "server/zone/ZoneClientSession.h"

#include <cpprest/filestream.h>
#include <cpprest/http_client.h>
#include <pplx/threadpool.h>

using namespace utility;
using namespace web;
using namespace web::http;
using namespace web::http::client;

SWGRealmsAPI::SWGRealmsAPI() {
	trxCount = 0;

	// Separate log file to avoid spamming the console
	setLoggingName("SWGRealmsAPI");
	setFileLogger("log/session_api.log", true, ConfigManager::instance()->getRotateLogAtStart());
	setLogSynchronized(true);
	setRotateLogSizeMB(ConfigManager::instance()->getInt("Core3.Login.API.RotateLogSizeMB", ConfigManager::instance()->getRotateLogSizeMB()));
	setLogToConsole(false);
	setGlobalLogging(false);
	setLogging(true);

	auto config = ConfigManager::instance();

	debugLevel = config->getInt("Core3.Login.API.DebugLevel", 0);

	setLogLevel(static_cast<Logger::LogLevel>(debugLevel));

	galaxyID = config->getZoneGalaxyID();

	dryRun = config->getBool("Core3.Login.API.DryRun", false);

	baseURL = config->getString("Core3.Login.API.BaseURL", "");

	if (baseURL.length() == 0) {
		warning() << "Missing Core3.Login.API.BaseURL, Sessions API disabled.";
		apiEnabled = false;
		return;
	} else {
		apiEnabled = true;
	}

	apiToken = config->getString("Core3.Login.API.APIToken", "");

	if (apiToken.length() == 0) {
		warning() << "Missing Core3.Login.API.APIToken, Sessions API disabled.";
		apiEnabled = false;
		return;
	}

	failOpen = config->getBool("Core3.Login.API.FailOpen", false);

	info(true) << "Starting " << toString();
}

SWGRealmsAPI::~SWGRealmsAPI() {
	crossplat::threadpool::shared_instance().service().stop();
	info(true) << "Shutdown";
}

String SWGRealmsAPI::toStringData() const {
	return toString();
}

String SWGRealmsAPI::toString() const {
	StringBuffer buf;

	buf << "SWGRealmsAPI " << this << " ["
		<< "apiEnabled: " << apiEnabled << ", "
		<< "trxCount: " << trxCount << ", "
		<< "errCount: " << errCount << ", "
		<< "failOpen: " << failOpen << ", "
		<< "dryRun: " << dryRun << ", "
		<< "debugLevel: " << debugLevel << ", "
		<< "baseURL: " << baseURL << "]"
		;

	return buf.toString();
}

void SWGRealmsAPI::apiCall(const String& src, const String& basePath, const SessionAPICallback& resultCallback, const String& method, const String& body) {
	// If not enabled just return ALLOW all the time
	if (!apiEnabled) {
		SessionApprovalResult result;

		result.setAction(SessionApprovalResult::ApprovalAction::ALLOW);
		result.setTitle("");
		result.setMessage("");
		result.setDetails("API Not enabled.");
		result.setDebugValue("trx_id", "api-disabled");

		Core::getTaskManager()->executeTask([resultCallback, result] {
			resultCallback(result);
		}, "SWGRealmsAPIResult-nop-" + src, "slowQueue");
		return;
	}

	Time startTime;

	incrementTrxCount();

	String path = basePath;

	if (dryRun) {
		path = basePath + (basePath.indexOf("?") == -1 ? "?" : "&") + "debug=1&dryrun=1";
	}

	debug() << src << " START apiCall [path=" << path << "]";

	web::http::client::http_client_config client_config;

	client_config.set_validate_certificates(false);

	utility::seconds timeout(5);

	client_config.set_timeout(timeout);

	http_client client(baseURL.toCharArray(), client_config);

	http_request req(method == "POST" ? methods::POST : methods::GET);

	String authHeader = "Bearer " + apiToken;

	req.headers().add(U("Authorization"), authHeader.toCharArray());

	req.set_request_uri(path.toCharArray());

	if (!body.isEmpty()) {
		req.set_body(body.toCharArray(), "application/json");
	}

	client.request(req)
		.then([this, src, path](pplx::task<http_response> task) {
			http_response resp;
			bool failed = false;

			try {
				resp = task.get();
			} catch (const http_exception& e) {
				error() << src << " " << path << " HTTP Exception caught: " << e.what();
				failed = true;
			}

			if (failed || resp.status_code() != 200) {
				incrementErrorCount();

				error() << src << " HTTP Status " << resp.status_code() << " returned.";

				auto json_err = json::value();

				json_err[U("action")] = json::value::string(U("TEMPFAIL"));
				json_err[U("title")] = json::value::string(U("Temporary Server Error"));
				json_err[U("message")] = json::value::string(U("If the error continues please contact support and mention error code = N"));

				StringBuffer buf;

				if (failed) {
					buf << "Exception caught handling request, ";
				}

				buf << "http_response.status_code() == " << resp.status_code();

				json_err[U("details")] = json::value::string(U(buf.toString().toCharArray()));

				return pplx::task_from_result(json_err);
			}

			return resp.extract_json();
		}).then([this, src, method, path, resultCallback, startTime](pplx::task<json::value> task) {
			SessionApprovalResult result;
			auto logPrefix = result.getClientTrxId() + " " + src + ": ";
			auto result_json = json::value();
			bool failed = false;

			try {
				result_json = task.get();
			} catch (const http_exception& e) {
				error() << logPrefix << " " << path << " HTTP Exception caught reading body: " << e.what();
				failed = true;
			}

			if (result_json.is_null()) {
				incrementErrorCount();
				error() << logPrefix << "Null JSON result from server.";
				result.setAction(SessionApprovalResult::ApprovalAction::TEMPFAIL);
				result.setTitle("Temporary Server Error");
				result.setMessage("If the error continues please contact support and mention error code = K");
			} else {
				result.setRawJSON(String(result_json.serialize().c_str()));

				if (result_json.has_field("action")) {
					result.setAction(String(result_json[U("action")].as_string().c_str()));
				} else if (failOpen) {
					warning() << logPrefix << "Missing action from result, failing to ALLOW: JSON: " << result_json.serialize().c_str();
					result.setAction(SessionApprovalResult::ApprovalAction::ALLOW);
				} else {
					incrementErrorCount();
					result.setAction(SessionApprovalResult::ApprovalAction::TEMPFAIL);
					result.setTitle("Temporary Server Error");
					result.setMessage("If the error continues please contact support and mention error code = L");
					result.setDetails("Missing action field from server");
				}

				if (result_json.has_field("title")) {
					result.setTitle(String(result_json[U("title")].as_string().c_str()));
				}

				if (result_json.has_field("message")) {
					result.setMessage(String(result_json[U("message")].as_string().c_str()));
				}

				if (result_json.has_field("details")) {
					result.setDetails(String(result_json[U("details")].as_string().c_str()));
				}

				if (result_json.has_field("eip")) {
					result.setEncryptedIP(String(result_json[U("eip")].as_string().c_str()));
				}

				if (result_json.has_field("session_id")) {
					result.setSessionID(String(result_json[U("session_id")].as_string().c_str()));
				}

				if (result_json.has_field("account_id")) {
					auto field = result_json[U("account_id")];

					if (field.is_number()) {
						result.setAccountID((uint32)field.as_number().to_uint32());
					}
				}

				if (result_json.has_field("station_id")) {
					auto field = result_json[U("station_id")];

					if (field.is_number()) {
						result.setStationID((uint32)field.as_number().to_uint32());
					}
				}

				if (result_json.has_field("debug")) {
					auto debug = result_json[U("debug")];

					if (debug.has_field("trx_id")) {
						result.setDebugValue("trx_id", String(debug[U("trx_id")].as_string().c_str()));
					}
				}
			}

			result.setElapsedTimeMS(startTime.miliDifference());

			if (result.getElapsedTimeMS() > 500)
				warning() << "Slow API Call: " << result.toString();

			if (dryRun) {
				debug() << logPrefix << "DryRun: original result = " << result;

				result.setAction(SessionApprovalResult::ApprovalAction::ALLOW);
				result.setTitle("");
				result.setMessage("");
				result.setDetails("");
				result.setDebugValue("trx_id", "dry-run-trx-id");
			}

			debug() << logPrefix << "END apiCall " << method << " [path=" << path << "] result = " << result;

			Core::getTaskManager()->executeTask([resultCallback, result] {
				resultCallback(result);
			}, "SWGRealmsAPIResult-" + src, "slowQueue");
		});
}

void SWGRealmsAPI::apiNotify(const String& src, const String& basePath) {
	apiCall(src, basePath, [=](const SessionApprovalResult& result) {
		if (!result.isActionAllowed()) {
			error() << src << " unexpected failure: " << result;
		}
	});
}

void SWGRealmsAPI::notifyGalaxyStart(uint32 galaxyID) {
	StringBuffer path;

	// Save for later
	this->galaxyID = galaxyID;

	path << "/v1/core3/galaxy/" << galaxyID << "/start?client_version=" << SWGREALMS_API_VERSION;

	apiNotify(__FUNCTION__, path.toString());
}

void SWGRealmsAPI::notifyGalaxyShutdown() {
	StringBuffer path;

	path << "/v1/core3/galaxy/" << galaxyID << "/shutdown?client_version=" << SWGREALMS_API_VERSION;

	apiNotify(__FUNCTION__, path.toString());
}

void SWGRealmsAPI::createSession(const String& username, const String& password, const String& clientVersion, const String& clientEndpoint, const SessionAPICallback& resultCallback) {
	if (!apiEnabled) {
		SessionApprovalResult result;
		result.setAction(SessionApprovalResult::ApprovalAction::REJECT);
		result.setTitle("Temporary Server Error");
		result.setMessage("If the error continues please contact support and mention error code = S");
		result.setDetails("SWGRealms API required for authentication but not configured");
		result.setDebugValue("trx_id", "api-disabled-auth");

		Core::getTaskManager()->executeTask([resultCallback, result] {
			resultCallback(result);
		}, "SWGRealmsAPIResult-nop-createSession", "slowQueue");

		return;
	}

	auto requestBody = json::value::object();
	requestBody[U("username")] = json::value::string(U(username.toCharArray()));
	requestBody[U("password")] = json::value::string(U(password.toCharArray()));
	requestBody[U("client_version")] = json::value::string(U(clientVersion.toCharArray()));
	requestBody[U("client_ip")] = json::value::string(U(clientEndpoint.toCharArray()));
	requestBody[U("galaxy_id")] = json::value::number(galaxyID);

	apiCall(__FUNCTION__, "/v1/core3/account/login", resultCallback, "POST", String(requestBody.serialize().c_str()));
}

void SWGRealmsAPI::approveNewSession(const String& ip, uint32 accountID, const SessionAPICallback& resultCallback) {
	StringBuffer path;

	path << "/v1/core3/account/" << accountID << "/galaxy/" << galaxyID << "/session/ip/" << ip << "/approval";

	apiCall(__FUNCTION__, path.toString(), resultCallback);
}

void SWGRealmsAPI::validateSession(const String& sessionID, uint32 accountID, const String& ip, const SessionAPICallback& resultCallback) {
	StringBuffer path;

	path << "/v1/core3/account/" << accountID
		<< "/galaxy/" << galaxyID
		<< "/session/ip/" << ip
		<< "/sessionHash/" << sessionID
		<< "/isvalidsession"
		;

	apiCall(__FUNCTION__, path.toString(), resultCallback);
}

void SWGRealmsAPI::notifySessionStart(const String& ip, uint32 accountID) {
	StringBuffer path;

	path << "/v1/core3/account/" << accountID << "/galaxy/" << galaxyID << "/session/ip/" << ip << "/start";

	apiNotify(__FUNCTION__, path.toString());
}

void SWGRealmsAPI::notifyDisconnectClient(const String& ip, uint32 accountID, uint64_t characterID, String eventType) {
	StringBuffer path;

	path << "/v1/core3/account/" << accountID << "/galaxy/" << galaxyID << "/session/ip/" << ip << "/player/" << characterID << "/disconnect"
		<< "?eventType=" << eventType;

	apiNotify(__FUNCTION__, path.toString());
}

void SWGRealmsAPI::approvePlayerConnect(const String& ip, uint32 accountID, uint64_t characterID,
		const ArrayList<uint32>& loggedInAccounts, const SessionAPICallback& resultCallback) {
	StringBuffer path;

	path << "/v1/core3/account/" << accountID << "/galaxy/" << galaxyID << "/session/ip/" << ip << "/player/" << characterID << "/approval";

	if (loggedInAccounts.size() > 0) {
		path << "?loggedin_accounts";

		for (int i = 0; i < loggedInAccounts.size(); ++i) {
			path << (i == 0 ? "=" : ",") << loggedInAccounts.get(i);
		}
	}

	apiCall(__FUNCTION__, path.toString(), resultCallback);
}

void SWGRealmsAPI::notifyPlayerOnline(const String& ip, uint32 accountID, uint64_t characterID,
		const SessionAPICallback& resultCallback) {
	StringBuffer path;

	path << "/v1/core3/account/" << accountID << "/galaxy/" << galaxyID << "/session/ip/" << ip << "/player/" << characterID << "/online";

	if (resultCallback != nullptr) {
		apiCall(__FUNCTION__, path.toString(), resultCallback);
	} else {
		apiNotify(__FUNCTION__, path.toString());
	}
}

void SWGRealmsAPI::notifyPlayerOffline(const String& ip, uint32 accountID, uint64_t characterID) {
	StringBuffer path;

	path << "/v1/core3/account/" << accountID << "/galaxy/" << galaxyID << "/session/ip/" << ip << "/player/" << characterID << "/offline";

	apiNotify(__FUNCTION__, path.toString());
}

bool SWGRealmsAPI::consoleCommand(const String& arguments) {
	StringTokenizer tokenizer(arguments);

	String subcmd;

	if (tokenizer.hasMoreTokens()) {
		tokenizer.getStringToken(subcmd);
		subcmd = subcmd.toLowerCase();
	}

	if (subcmd == "help") {
		System::out << "Available swgrealms commands:" << endl
			<< "\thelp - This command" << endl
			<< "\tenable - Enable SWGRealms API" << endl
			<< "\tdisable - Disable SWGRealms API" << endl
			<< "\tstatus - SWGRealms API status" << endl
			<< "\tdryrun {off} - Control dry run setting" << endl
			<< "\tdebug {level} - Set debug level" << endl
			;
		return true;
	} else if (subcmd == "enable") {
		if (baseURL.length() == 0 || apiToken.length() == 0) {
			info(true) << "SWGRealmsAPI can not be enabled without Core3.Login.API.BaseURL and Core3.Login.API.APIToken.";
		} else {
			apiEnabled = true;
			info(true) << "SWGRealmsAPI enabled.";
		}
		return true;
	} else if (subcmd == "disable") {
		apiEnabled = false;
		info(true) << "SWGRealmsAPI disabled.";
		return true;
	} else if (subcmd == "status") {
		System::out << "Status for " << toString() << endl;
		return true;
	} else if (subcmd == "dryrun") {
		bool newDryRun = true;

		if (tokenizer.hasMoreTokens()) {
			String arg1;
			tokenizer.getStringToken(arg1);

			if (arg1.toLowerCase() == "off") {
				newDryRun = false;
			}
		}

		dryRun = newDryRun;

		if (dryRun) {
			info(true) << "SWGRealmsAPI set to dry run, api calls continue but results are ignored.";
		} else {
			info(true) << "SWGRealmsAPI set to run, api results will be honored by the server.";
		}

		return true;
	} else if (subcmd == "debug" || subcmd == "debuglevel") {
		int newDebugLevel = 9;

		if (tokenizer.hasMoreTokens()) {
			newDebugLevel = tokenizer.getIntToken();
		}

		debugLevel = newDebugLevel;

		info(true) << "DebugLevel set to " << debugLevel << " by console command.";

		return true;
	}

	info(true) << "Unknown swgrealms subcommand: " << subcmd;

	return false;
}

String SessionApprovalResult::toStringData() const {
	return toString();
}

String SessionApprovalResult::toString() const {
	StringBuffer buf;

	buf << "SessionApprovalResult " << this << " ["
		<< "clientTrxId: " << getClientTrxId() << ", "
		<< "trxId: " << getTrxId() << ", "
		<< "action: " << actionToString(getAction()) << ", "
		<< "title: '" << getTitle() << "', "
		<< "message: '" << getMessage() << "', "
		<< "details: '" << getDetails() << "'"
		;

	if (getRawJSON().length() > 0) {
		buf << ", JSON: '" << getRawJSON() << "'";
	}

	buf << ", elapsedTimeMS: " << getElapsedTimeMS() << "]";

	return buf.toString();
}

String SessionApprovalResult::getLogMessage() const {
	int debugLevel = SWGRealmsAPI::instance()->getDebugLevel();

	StringBuffer buf;

	buf << "SessionApprovalResult " << this << " ["
		<< "clientTrxId: " << getClientTrxId() << ", "
		<< "trxId: " << getTrxId() << ", "
		<< "action: " << actionToString(getAction()) << ", "
		;

	if (debugLevel == Logger::DEBUG) {
		buf << "message: '" << getMessage() << "', ";
	}

	buf << "details: '" << getDetails() << "'" ;

	if (debugLevel == Logger::DEBUG && getRawJSON().length() > 0) {
		buf << ", JSON: '" << getRawJSON() << "'";
	}

	buf << ", elapsedTimeMS: " << getElapsedTimeMS() << "]";

	return buf.toString();
}

SessionApprovalResult::SessionApprovalResult() {
	// Generate simple code for log tracing
	uint64 trxid = (System::getMikroTime() << 8) | System::random(255);

	resultClientTrxId = String::hexvalueOf(trxid);
	resultAction = ApprovalAction::UNKNOWN;
	resultElapsedTimeMS = 0ull;

	resultDebug.setNullValue("<not set>");
}

void SWGRealmsAPI::updateClientIPAddress(ZoneClientSession* client, const SessionApprovalResult& result) {
	if (client != nullptr && !result.getEncryptedIP().isEmpty()) {
		auto oldIP = client->getIPAddress();

		Locker lock(client);
		client->setIPAddress(result.getEncryptedIP());
	}
}

#endif // WITH_SWGREALMS_API
