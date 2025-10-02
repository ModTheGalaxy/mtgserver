/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef ZONEMESSAGEPROCESSORTASK_H_
#define ZONEMESSAGEPROCESSORTASK_H_

#include "ZonePacketHandler.h"
#include "ClientCore.h"

class ZoneMessageProcessorTask : public Task, public Logger {
	Message* message;

	ZonePacketHandler* packetHandler;

public:
	ZoneMessageProcessorTask(Message* msg, ZonePacketHandler* handler) : Logger("ZoneMessageProcessorTask") {
		message = msg;

		packetHandler = handler;
		setLogLevel(static_cast<Logger::LogLevel>(ClientCore::getLogLevel()));
	}

	~ZoneMessageProcessorTask() {
		delete message;
		message = nullptr;
	}

	void run() {
		try {
			Reference<BaseClient*> client = (BaseClient*) message->getClient();

			if (client->isAvailable())
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
