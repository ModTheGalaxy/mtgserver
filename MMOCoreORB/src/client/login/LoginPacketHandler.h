/*
 * LoginPacketHandler.h
 *
 *  Created on: Sep 4, 2009
 *      Author: theanswer
 */

#ifndef LOGINPACKETHANDLER_H_
#define LOGINPACKETHANDLER_H_

#include "engine/engine.h"
#include "ClientCore.h"
#include "LoginSession.h"

class LoginPacketHandler : public Mutex, public Logger {
	Reference<LoginSession*> loginSession;
	uint8_t pending_packets;

public:
	LoginPacketHandler(LoginSession* session) : Logger("LoginPacketHandler") {
		pending_packets = 0xF;
		loginSession = session;
		setLogLevel(static_cast<Logger::LogLevel>(ClientCore::getLogLevel()));
	}

	~LoginPacketHandler() {
	}

	void loginComplete() {
		loginSession->signalCompletion();
	}

	void handleMessage(Message* pack);
	void handleEnumerateCharacterId(Message* pack);
	void handleLoginClientToken(Message* pack);
	void handleLoginEnumCluster(Message* pack);
	void handleLoginClusterStatus(Message* pack);
	void handleErrorMessage(Message* pack);
};

#endif /* LOGINPACKETHANDLER_H_ */
