/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef LOGINMESSAGEPROCESSORTASK_H_
#define LOGINMESSAGEPROCESSORTASK_H_

#include "LoginPacketHandler.h"
#include "ClientCore.h"

class LoginMessageProcessorTask : public Task, public Logger {
	Message* message;

	LoginPacketHandler* packetHandler;

public:
	LoginMessageProcessorTask(Message* msg, LoginPacketHandler* handler) : Logger("LoginMessageProcessorTask") {
		message = msg;

		packetHandler = handler;
		setLogLevel(static_cast<Logger::LogLevel>(ClientCore::getLogLevel()));
	}

	~LoginMessageProcessorTask() {
		delete message;
		message = nullptr;
	}

	void run() {
		try {
			packetHandler->handleMessage(message);
		} catch (PacketIndexOutOfBoundsException& e) {
			error() << e.getMessage();
			e.printStackTrace();
		} catch (Exception& e) {
			error() << e.getMessage();
			e.printStackTrace();
		}

		delete message;
		message = nullptr;
	}

};

#endif /*LOGINMESSAGEPROCESSORTASK_H_*/
