/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#include <boost/program_options.hpp>
#include <fstream>
#include "engine/util/JSONSerializationType.h"
#include "client/zone/Zone.h"
#include "client/zone/managers/object/ObjectManager.h"

#include "ClientCore.h"

#include "client/login/LoginSession.h"

int exit_result = 1;

ClientCore::ClientCore(const ClientCoreOptions& opts) : Core("log/core3client.log", "client3"), Logger("CoreClient") {
	options = opts;
	zone = nullptr;

	overallStartTime.updateToCurrentTime();

	Core::initializeProperties("Client3");

	// Fill in missing values from client3.lua
	options.updateWithProperties();

	// Override with user-provided values (higher priority)
	options.saveToProperties();

	setLogLevel(static_cast<LogLevel>(options.logLevel));
	info(true) << "Log level set to: " << Logger::getLogType(static_cast<LogLevel>(options.logLevel)) << "(" << options.logLevel << ")";

	info(true) << "Current options: " << options;
}

void ClientCore::initialize() {
	info(true) << __PRETTY_FUNCTION__ << " start";
}

void ClientCore::run() {
	info(true) << "initialized";

	Reference<LoginSession*> loginSession;
	bool loginSuccess = loginCharacter(loginSession);

	if (!loginSuccess) {
		info(true) << "Failed to login character.";
		exit_result = 101;

		if (!options.saveState.isEmpty()) {
			saveStateToFile(options.saveState, loginSession);
		}
		return;
	}

	if (options.loginOnly) {
		info(true) << "Login-only mode: skipping zone connection";

		if (!options.saveState.isEmpty()) {
			saveStateToFile(options.saveState, loginSession);
		}

		exit_result = 0;
		return;
	}

	info(true) << "Waiting for zone connection...";

	if (zone != nullptr && zone->waitForSceneReady(ClientCore::getZoneTimeout() * 1000)) {
		info(true) << "Zone connection established and scene loaded!";
		info(true) << "Login flow test completed successfully!";
	} else {
		error() << "Timeout waiting for zone connection";
		exit_result = 102;
	}

	if (!options.saveState.isEmpty()) {
		saveStateToFile(options.saveState, loginSession);
	}

	info(true) << "Shutting down...";

	logoutCharacter();

	exit_result = 0;
}

bool ClientCore::loginCharacter(Reference<LoginSession*>& loginSession) {
	try {
		info(true) << "Logging in as: " << options.username;

		loginSession = new LoginSession(options.username, options.password);
		loginSession->run();

		auto numCharacters = loginSession->getCharacterListSize();

		if (numCharacters == 0) {
			info(true) << __FUNCTION__ << ": No characters found to login?";
			return false;
		}

		Optional<const CharacterListEntry&> character;

		if (options.characterOid != 0) {
			character = loginSession->selectCharacterByOID(options.characterOid);
			if (!character) {
				info(true) << "ERROR: Character with OID " << options.characterOid << " not found";
				return false;
			}
		} else if (!options.characterFirstname.isEmpty()) {
			character = loginSession->selectCharacterByFirstname(options.characterFirstname);
			if (!character) {
				info(true) << "ERROR: Character with firstname '" << options.characterFirstname << "' not found";
				return false;
			}
		} else {
			character = loginSession->selectRandomCharacter();
		}

		if (!character) {
			info(true) << __FUNCTION__ << ": Failed to select any character";
			return false;
		}

		auto objid = character->getObjectID();
		auto galaxyId = character->getGalaxyID();

		info(true) << "Selected character: " << *character;

		uint32 acc = loginSession->getAccountID();
		const String& sessionID = loginSession->getSessionID();

		info(true) << "Login completed - Account: " << acc << ", Session: " << sessionID;

		auto galaxy = loginSession->getGalaxy(galaxyId);

		// Store selected galaxy for JSON output
		selectedGalaxy = galaxy;

		info(true) << "Zone into " << galaxy;

		if (galaxy.getAddress().isEmpty()) {
			throw Exception("Invalid galaxy, missing IP address.");
		}

		if (!options.loginOnly) {
			zone = new Zone(objid, acc, sessionID, galaxy.getAddress(), galaxy.getPort());
			zone->start();
		}
	} catch (Exception& e) {
		e.printMessage();
		return false;
	}

	return true;
}

void ClientCore::logoutCharacter() {
	if (zone == nullptr || !zone->isStarted())
		return;

	info(true) << __FUNCTION__ << "(" << index << ")";

	zone->disconnect();

	delete zone;
}

void ClientCore::saveStateToFile(const String& filename, LoginSession* loginSession) {
	try {
		JSONSerializationType jsonData;

		// Overall timing
		jsonData["totalElapsedMs"] = overallStartTime.miliDifference();

		// Timestamp
		Time now;
		now.updateToCurrentTime();
		jsonData["@timestamp"] = now.getFormattedTimeFull().toCharArray();
		jsonData["time_msecs"] = now.getMiliTime();

		// Login stats
		if (loginSession != nullptr) {
			jsonData["loginStats"] = loginSession->collectStats();

			// Account info
			JSONSerializationType account;
			account["id"] = loginSession->getAccountID();
			account["username"] = loginSession->getSessionID().isEmpty() ? "" : loginSession->collectStats()["username"];
			account["sessionId"] = loginSession->getSessionID().toCharArray();
			jsonData["account"] = account;

			// Galaxies - iterate through all galaxies in the map
			JSONSerializationType galaxiesArray = JSONSerializationType::array();
			auto& galaxyMap = loginSession->getGalaxies();
			for (int i = 0; i < galaxyMap.size(); ++i) {
				auto& galaxy = galaxyMap.get(i);
				if (!galaxy.getName().isEmpty()) {
					JSONSerializationType galaxyObj;
					galaxyObj["id"] = galaxy.getID();
					galaxyObj["name"] = galaxy.getName().toCharArray();
					galaxyObj["address"] = galaxy.getAddress().toCharArray();
					galaxyObj["port"] = galaxy.getPort();
					galaxyObj["population"] = galaxy.getPopulation();
					galaxiesArray.push_back(galaxyObj);
				}
			}
			jsonData["galaxies"] = galaxiesArray;

			// Characters
			JSONSerializationType charactersArray = JSONSerializationType::array();
			for (int i = 0; i < loginSession->getCharacterListSize(); ++i) {
				const auto& character = loginSession->getCharacterByIndex(i);
				JSONSerializationType charObj;
				charObj["name"] = character.getFirstName().toCharArray();
				charObj["oid"] = character.getObjectID();
				charObj["galaxyId"] = character.getGalaxyID();
				charactersArray.push_back(charObj);
			}
			jsonData["characters"] = charactersArray;
		}

		// Zone stats
		if (zone != nullptr) {
			jsonData["zoneStats"] = zone->collectStats();
			jsonData["zoneConnected"] = true;

			// Selected zone info
			JSONSerializationType selectedZone;
			selectedZone["characterId"] = zone->getCharacterID();
			selectedZone["address"] = zone->getGalaxyAddress().toCharArray();
			selectedZone["port"] = zone->getGalaxyPort();
			jsonData["selectedZone"] = selectedZone;
		} else {
			jsonData["zoneConnected"] = false;
		}

		// Success flags
		jsonData["loginSuccess"] = (loginSession != nullptr && loginSession->getAccountID() != 0);

		// Selected galaxy (if we got that far)
		if (selectedGalaxy) {
			JSONSerializationType selectedGalaxyJson;
			selectedGalaxyJson["id"] = selectedGalaxy->getID();
			selectedGalaxyJson["name"] = selectedGalaxy->getName().toCharArray();
			selectedGalaxyJson["address"] = selectedGalaxy->getAddress().toCharArray();
			selectedGalaxyJson["port"] = selectedGalaxy->getPort();
			selectedGalaxyJson["population"] = selectedGalaxy->getPopulation();
			jsonData["selectedGalaxy"] = selectedGalaxyJson;
		}

		// Runtime options
		jsonData["runtimeOptions"] = options.getAsJSON();

		// Write to file
		std::ofstream file(filename.toCharArray());
		if (file.is_open()) {
			file << jsonData.dump(2);  // Pretty print with 2-space indent
			file.close();
			info(true) << "State saved to: " << filename;
		} else {
			error() << "Failed to open file for writing: " << filename;
		}

	} catch (Exception& e) {
		error() << "Error saving state: " << e.getMessage();
	}
}

void ClientCoreOptions::loadEnvFile(const String& filename) {
	std::ifstream file(filename.toCharArray());
	if (!file.is_open()) return;

	std::string line;
	while (std::getline(file, line)) {
		String envLine(line.c_str());
		envLine = envLine.trim();
		if (envLine.isEmpty() || envLine.charAt(0) == '#') continue;

		StringTokenizer tokenizer(envLine);
		tokenizer.setDelimeter("=");

		if (tokenizer.hasMoreTokens()) {
			String key = tokenizer.getStringToken();
			if (tokenizer.hasMoreTokens()) {
				String value;
				tokenizer.finalToken(value);
				setenv(key.toCharArray(), value.toCharArray(), 1);
			}
		}
	}
}

bool ClientCoreOptions::loadFromJSON(const String& filename) {
	try {
		std::ifstream file(filename.toCharArray());
		if (!file.is_open()) {
			return false;
		}

		JSONSerializationType json;
		file >> json;

		// Load all options from JSON
		if (json.contains("username")) username = json["username"];
		if (json.contains("password")) password = json["password"];
		if (json.contains("loginHost")) loginHost = json["loginHost"];
		if (json.contains("loginPort")) loginPort = json["loginPort"];
		if (json.contains("loginTimeout")) loginTimeout = json["loginTimeout"];
		if (json.contains("zoneTimeout")) zoneTimeout = json["zoneTimeout"];
		if (json.contains("clientVersion")) clientVersion = json["clientVersion"];
		if (json.contains("logLevel")) logLevel = json["logLevel"];
		if (json.contains("characterOid")) characterOid = json["characterOid"];
		if (json.contains("characterFirstname")) characterFirstname = json["characterFirstname"];
		if (json.contains("saveState")) saveState = json["saveState"];
		if (json.contains("loginOnly")) loginOnly = json["loginOnly"];

		return true;
	} catch (const std::exception& e) {
		return false;
	}
}

void ClientCoreOptions::parse(int argc, char* argv[]) {
	namespace po = boost::program_options;

	// First pass to get --env option
	po::options_description env_desc("Environment");
	env_desc.add_options()
		("env", po::value<std::string>(), "Environment file to load");

	po::variables_map env_vm;
	po::store(po::command_line_parser(argc, argv).options(env_desc).allow_unregistered().run(), env_vm);
	po::notify(env_vm);

	// Load .env files
	if (env_vm.count("env")) {
		loadEnvFile(env_vm["env"].as<std::string>().c_str());
	} else {
		loadEnvFile(".env");
		loadEnvFile(".env-core3client");
	}

	// Load options from JSON file if specified in environment
	if (env_vm.count("options-json")) {
		String jsonFile = env_vm["options-json"].as<std::string>().c_str();
		if (!loadFromJSON(jsonFile)) {
			System::err << "Error: Failed to load options from JSON file: " << jsonFile << endl;
			exit(1);
		}
	}

	// Full options parsing
	po::options_description desc("Options");
	desc.add_options()
		("help,h", "Show help message")
		("username,u", po::value<std::string>(), "Username for login")
		("password,p", po::value<std::string>(), "Password for login")
		("login-host", po::value<std::string>(), "Login server hostname")
		("login-port", po::value<int>(), "Login server port")
		("client-version", po::value<std::string>(), "Client version string")
		("login-timeout", po::value<int>(), "Login timeout in seconds")
		("zone-timeout", po::value<int>(), "Zone timeout in seconds")
		("log-level", po::value<std::string>(), "Log level (0-5 or fatal/error/warning/log/info/debug)")
		("character-oid", po::value<uint64>(), "Character object ID to select")
		("character-firstname", po::value<std::string>(), "Character first name to select")
		("save-state", po::value<std::string>(), "Save login state to JSON file")
		("login-only", "Only perform login, skip zone connection")
		("options-json", po::value<std::string>(), "Load options from JSON file")
		("generate-options-json", "Generate default options JSON to stdout and exit")
		("env", po::value<std::string>(), "Environment file to load");

	po::variables_map vm;
	po::store(po::parse_command_line(argc, argv, desc), vm);
	po::notify(vm);

	// Load options from JSON file if specified on command line (before processing other options)
	if (vm.count("options-json")) {
		String jsonFile = vm["options-json"].as<std::string>().c_str();
		if (!loadFromJSON(jsonFile)) {
			System::err << "Error: Failed to load options from JSON file: " << jsonFile << endl;
			exit(1);
		}
	}

	if (vm.count("help")) {
		std::cout << desc << std::endl;
		exit(0);
	}

	// Generate default options JSON and exit
	if (vm.count("generate-options-json")) {
		ClientCoreOptions defaults;
		std::cout << defaults.getAsJSON().dump(2) << std::endl;
		exit(0);
	}

	// Get username from command line or environment
	if (vm.count("username")) {
		username = vm["username"].as<std::string>().c_str();
	} else {
		const char* envUser = getenv("CORE3_CLIENT_USERNAME");
		if (envUser) {
			username = envUser;
		} else {
			throw Exception("ERROR: Please provide --username or set CORE3_CLIENT_USERNAME environment variable");
		}
	}

	// Get password from command line or environment
	if (vm.count("password")) {
		password = vm["password"].as<std::string>().c_str();
	} else {
		const char* envPass = getenv("CORE3_CLIENT_PASSWORD");
		if (envPass) {
			password = envPass;
		} else {
			throw Exception("ERROR: Please provide --password or set CORE3_CLIENT_PASSWORD environment variable");
		}
	}

	// Get login host from command line or environment
	if (vm.count("login-host")) {
		loginHost = vm["login-host"].as<std::string>().c_str();
	} else {
		const char* envHost = getenv("CORE3_CLIENT_LOGINHOST");
		if (envHost) {
			loginHost = envHost;
		}
	}

	// Get login port from command line or environment
	if (vm.count("login-port")) {
		loginPort = vm["login-port"].as<int>();
	} else {
		const char* envPort = getenv("CORE3_CLIENT_LOGINPORT");
		if (envPort) {
			loginPort = Integer::valueOf(envPort);
		}
	}

	// Get client version from command line or environment
	if (vm.count("client-version")) {
		clientVersion = vm["client-version"].as<std::string>().c_str();
	} else {
		const char* envVersion = getenv("CORE3_CLIENT_VERSION");
		if (envVersion) {
			clientVersion = envVersion;
		}
	}

	// Get login timeout from command line or environment
	if (vm.count("login-timeout")) {
		loginTimeout = vm["login-timeout"].as<int>();
	} else {
		const char* envTimeout = getenv("CORE3_CLIENT_LOGIN_TIMEOUT");
		if (envTimeout) {
			loginTimeout = Integer::valueOf(envTimeout);
		}
	}

	// Get zone timeout from command line or environment
	if (vm.count("zone-timeout")) {
		zoneTimeout = vm["zone-timeout"].as<int>();
	} else {
		const char* envTimeout = getenv("CORE3_CLIENT_ZONE_TIMEOUT");
		if (envTimeout) {
			zoneTimeout = Integer::valueOf(envTimeout);
		}
	}

	// Get log level from command line or environment
	if (vm.count("log-level")) {
		logLevel = parseLogLevel(vm["log-level"].as<std::string>().c_str());
	} else {
		const char* envLevel = getenv("CORE3_CLIENT_LOG_LEVEL");
		if (envLevel) {
			logLevel = parseLogLevel(envLevel);
		}
	}

	// Get character OID from command line or environment
	if (vm.count("character-oid")) {
		characterOid = vm["character-oid"].as<uint64>();
	} else {
		const char* envOid = getenv("CORE3_CLIENT_CHARACTER_OID");
		if (envOid) {
			characterOid = UnsignedLong::valueOf(envOid);
		}
	}

	// Get character firstname from command line or environment
	if (vm.count("character-firstname")) {
		characterFirstname = vm["character-firstname"].as<std::string>().c_str();
	} else {
		const char* envName = getenv("CORE3_CLIENT_CHARACTER_FIRSTNAME");
		if (envName) {
			characterFirstname = envName;
		}
	}

	// Get save-state filename
	if (vm.count("save-state")) {
		saveState = vm["save-state"].as<std::string>().c_str();
	}

	// Get login-only flag
	if (vm.count("login-only")) {
		loginOnly = true;
	}
}

void ClientCoreOptions::updateWithProperties() {
	if (loginHost.isEmpty()) {
		loginHost = Core::getProperty("Client3.LoginHost", "127.0.0.1");
	}

	if (loginPort == 0) {
		loginPort = Core::getIntProperty("Client3.LoginPort", 44453);
	}

	if (clientVersion.isEmpty()) {
		clientVersion = Core::getProperty("Client3.ClientVersion", "20050408-18:00");
	}

	if (loginTimeout == 0) {
		loginTimeout = Core::getIntProperty("Client3.LoginTimeout", 10);
	}

	if (zoneTimeout == 0) {
		zoneTimeout = Core::getIntProperty("Client3.ZoneTimeout", 30);
	}

	if (logLevel == -1) {
		logLevel = Core::getIntProperty("Client3.LogLevel", static_cast<int>(Logger::INFO));
	}

	if (characterOid == 0) {
		characterOid = Core::getLongProperty("Client3.CharacterOid", 0);
	}

	if (characterFirstname.isEmpty()) {
		characterFirstname = Core::getProperty("Client3.CharacterFirstname", "");
	}
}

int ClientCoreOptions::parseLogLevel(const String& levelStr) {
	String level = levelStr.toLowerCase();

	if (level == "fatal") return Logger::FATAL;
	if (level == "error") return Logger::ERROR;
	if (level == "warning" || level == "warn") return Logger::WARNING;
	if (level == "log") return Logger::LOG;
	if (level == "info") return Logger::INFO;
	if (level == "debug") return Logger::DEBUG;

	// Try to parse as number
	try {
		return Integer::valueOf(levelStr);
	} catch (...) {
		return Logger::INFO; // Default to INFO on parse failure
	}
}

void ClientCoreOptions::saveToProperties() {
	if (!loginHost.isEmpty()) {
		Core::setProperty("Client3.LoginHost", loginHost);
	}

	if (loginPort != 0) {
		Core::setProperty("Client3.LoginPort", String::valueOf(loginPort));
	}

	if (!clientVersion.isEmpty()) {
		Core::setProperty("Client3.ClientVersion", clientVersion);
	}

	if (loginTimeout != 0) {
		Core::setProperty("Client3.LoginTimeout", String::valueOf(loginTimeout));
	}

	if (zoneTimeout != 0) {
		Core::setProperty("Client3.ZoneTimeout", String::valueOf(zoneTimeout));
	}

	if (logLevel != -1) {
		Core::setIntProperty("Client3.LogLevel", logLevel);
	}

	if (characterOid != 0) {
		Core::setLongProperty("Client3.CharacterOid", characterOid);
	}

	if (!characterFirstname.isEmpty()) {
		Core::setProperty("Client3.CharacterFirstname", characterFirstname);
	}
}

String ClientCoreOptions::toString() const {
	return getAsJSON().dump().c_str();
}

JSONSerializationType ClientCoreOptions::getAsJSON() const {
	JSONSerializationType jsonData;
	jsonData["username"] = username.toCharArray();
	jsonData["password"] = "***";
	jsonData["loginHost"] = loginHost.toCharArray();
	jsonData["loginPort"] = loginPort;
	jsonData["clientVersion"] = clientVersion.toCharArray();
	jsonData["loginTimeout"] = loginTimeout;
	jsonData["zoneTimeout"] = zoneTimeout;
	jsonData["logLevel"] = logLevel;
	jsonData["characterOid"] = characterOid;
	jsonData["characterFirstname"] = characterFirstname.toCharArray();
	jsonData["saveState"] = saveState.toCharArray();
	jsonData["loginOnly"] = loginOnly;
	return jsonData;
}

String ClientCoreOptions::toStringData() const {
	return toString();
}

int main(int argc, char* argv[]) {
	try {
		ClientCoreOptions opts;
		opts.parse(argc, argv);

		StackTrace::setBinaryName("core3client");

		// Configure engine3
		Core::setProperty("TaskManager.defaultSchedulerThreads", "2");
		Core::setProperty("TaskManager.defaultIOSchedulers", "2");
		Core::setProperty("TaskManager.defaultWorkerQueues", "1");
		Core::setProperty("TaskManager.defaultWorkerThreadsPerQueue", "2");

		ClientCore core(opts);
		core.start();
		System::out << "core.start() returned" << endl;
	} catch (Exception& e) {
		System::out << e.getMessage() << "\n";
		e.printStackTrace();
		exit_result = 100;
	}

	System::out << "exit(" << exit_result << ")" << endl;

	return exit_result;
}
