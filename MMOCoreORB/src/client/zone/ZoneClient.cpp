/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#include "ZoneClient.h"
#include "ClientCore.h"
#include "ZonePacketHandler.h"
#include "ZoneMessageProcessorTask.h"

ZoneClient::ZoneClient(const String& address, int port) {
	packetCount.set(0);

	client = new BaseClient(address, port);
	client->setHandler(this);

	client->setLogging(true);
	client->setLoggingName("ZoneClient");
	client->setLogLevel(static_cast<Logger::LogLevel>(ClientCore::getLogLevel()));

	accountID = 0;

	zone = nullptr;

	basePacketHandler = new BasePacketHandler("ZoneClient", this);
	zonePacketHandler = nullptr;
}

ZoneClient::~ZoneClient() {

	delete basePacketHandler,
	basePacketHandler = nullptr;
}

void ZoneClient::handleMessage(ServiceClient* client, Packet* message) {
	basePacketHandler->handlePacket(ZoneClient::client, message);
}

void ZoneClient::initialize() {
	zonePacketHandler = new ZonePacketHandler("ZonePacketHandler", zone);

	client->initialize();
}

void ZoneClient::processMessage(Message* message) {
	packetCount.increment();

	ZoneMessageProcessorTask* task = new ZoneMessageProcessorTask(message, zonePacketHandler);
	Core::getTaskManager()->executeTask(task);
}
