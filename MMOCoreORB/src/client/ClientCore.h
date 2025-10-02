/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef CLIENTCORE_H_
#define CLIENTCORE_H_

#include "system/lang.h"
#include "server/login/objects/GalaxyList.h"

class Zone;

struct ClientCoreOptions {
	String username;
	String password;
	String loginHost;
	int loginPort = 0;
	String clientVersion;
	int loginTimeout = 0;
	int zoneTimeout = 0;
	int logLevel = -1;
	uint64 characterOid = 0;
	String characterFirstname;
	String saveState;
	bool loginOnly = false;

	void parse(int argc, char* argv[]);
	void updateWithProperties();
	void saveToProperties();
	bool loadFromJSON(const String& filename);
	JSONSerializationType getAsJSON() const;
	String toString() const;
	String toStringData() const;

private:
	void loadEnvFile(const String& filename);
	int parseLogLevel(const String& levelStr);
};

class ClientCore : public Core, public Logger {
	ClientCoreOptions options;
	Zone* zone;
	Time overallStartTime;
	Optional<Galaxy> selectedGalaxy;

public:
	static int getLogLevel() {
		Core* instance = Core::getCoreInstance();
		if (instance) {
			ClientCore* clientCore = static_cast<ClientCore*>(instance);
			if (clientCore && clientCore->options.logLevel != -1) {
				return clientCore->options.logLevel;
			}
		}
		return Core::getIntProperty("Client3.LogLevel", Logger::INFO);
	}

	static String getLoginHost() {
		Core* instance = Core::getCoreInstance();
		if (instance) {
			ClientCore* clientCore = static_cast<ClientCore*>(instance);
			if (clientCore && !clientCore->options.loginHost.isEmpty()) {
				return clientCore->options.loginHost;
			}
		}
		return Core::getProperty("Client3.LoginHost", "127.0.0.1");
	}

	static int getLoginPort() {
		Core* instance = Core::getCoreInstance();
		if (instance) {
			ClientCore* clientCore = static_cast<ClientCore*>(instance);
			if (clientCore && clientCore->options.loginPort != 0) {
				return clientCore->options.loginPort;
			}
		}
		return Core::getIntProperty("Client3.LoginPort", 44453);
	}

	static String getClientVersion() {
		Core* instance = Core::getCoreInstance();
		if (instance) {
			ClientCore* clientCore = static_cast<ClientCore*>(instance);
			if (clientCore && !clientCore->options.clientVersion.isEmpty()) {
				return clientCore->options.clientVersion;
			}
		}
		return Core::getProperty("Client3.ClientVersion", "20050408-18:00");
	}

	static int getLoginTimeout() {
		Core* instance = Core::getCoreInstance();
		if (instance) {
			ClientCore* clientCore = static_cast<ClientCore*>(instance);
			if (clientCore && clientCore->options.loginTimeout != 0) {
				return clientCore->options.loginTimeout;
			}
		}
		return Core::getIntProperty("Client3.LoginTimeout", 10);
	}

	static int getZoneTimeout() {
		Core* instance = Core::getCoreInstance();
		if (instance) {
			ClientCore* clientCore = static_cast<ClientCore*>(instance);
			if (clientCore && clientCore->options.zoneTimeout != 0) {
				return clientCore->options.zoneTimeout;
			}
		}
		return Core::getIntProperty("Client3.ZoneTimeout", 30);
	}

public:
	ClientCore(const ClientCoreOptions& opts);

	void initialize();

	void run();

	bool loginCharacter(Reference<class LoginSession*>& loginSession);
	void logoutCharacter();

private:
	void saveStateToFile(const String& filename, class LoginSession* loginSession);
};

#endif /*CLIENTCORE_H_*/
