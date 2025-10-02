/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#include "LoginMessageProcessorTask.h"

#include "LoginPacketHandler.h"

#include "LoginClient.h"
#include "ClientCore.h"

LoginClient::LoginClient(const String& host, int port) {
	packetCount.set(0);

	client = new BaseClient(host, port);

	client->setLogging(true);
	client->setLoggingName("LoginClient");
	client->setLogLevel(static_cast<Logger::LogLevel>(ClientCore::getLogLevel()));

	loginSession = nullptr;

	basePacketHandler = new BasePacketHandler("LoginClient", this);
	loginPacketHandler = nullptr;
}

LoginClient::~LoginClient() {
	delete basePacketHandler;
	basePacketHandler = nullptr;
}

void LoginClient::initialize() {
	loginPacketHandler = new LoginPacketHandler(loginSession);

	client->setHandler(this);
	client->initialize();
}

void LoginClient::handleMessage(ServiceClient* client, Packet* message) {
	basePacketHandler->handlePacket(LoginClient::client, message);
}

void LoginClient::processMessage(Message* message) {
	packetCount.increment();

	// peek at message
	Message pack = *message;
	sys::uint16 opcount = pack.parseShort();
	sys::uint32 opcode = pack.parseInt();

	String what;
	int expectedOrder;

	switch(opcode) {
		case STRING_HASHCODE("LoginClientToken"): what = "LoginClientToken"; expectedOrder = 1; break;
		case STRING_HASHCODE("LoginEnumCluster"): what = "LoginEnumCluster"; expectedOrder = 2; break;
		case STRING_HASHCODE("LoginClusterStatus"): what = "LoginClusterStatus"; expectedOrder = 3; break;
		case STRING_HASHCODE("EnumerateCharacterId"):what = "EnumerateCharacterId"; expectedOrder = 4; break;
		default: what = "Unknown"; expectedOrder = -1; break;
	}

	if (packetCount != expectedOrder) {
		this->client->warning() << "\033[43;30m"
			 << "Packet order warning: got " << what << " as packet#" << packetCount << ", expected#" << expectedOrder
			 << "\033[0m";
	}

	LoginMessageProcessorTask* task = new LoginMessageProcessorTask(message, loginPacketHandler);
	Core::getTaskManager()->executeTask(task);
}
