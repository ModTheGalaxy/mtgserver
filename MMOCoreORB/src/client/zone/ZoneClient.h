/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef ZONECLIENT_H_
#define ZONECLIENT_H_

#include "engine/engine.h"
#include "client/zone/ZonePacketHandler.h"

class Zone;
class ZonePacketHandler;

class ZoneClient : public ServiceHandler {
	AtomicInteger packetCount;

	Reference<BaseClient*> client;

	Zone* zone;

	uint32 accountID;

	BasePacketHandler* basePacketHandler;
	ZonePacketHandler* zonePacketHandler;

	MessageQueue messageQueue;

public:
	ZoneClient(const String& address, int port);

	~ZoneClient();

	void initialize();

	bool connect() {
		return client->connect();
	}

	void disconnect() {
		client->info(true) << "disconnecting after " << packetCount.get() << " packets.";

		client->disconnect();

		Socket* socket = client->getSocket();

		if (socket != nullptr) {
			socket->shutdown(SHUT_RDWR);
			socket->close();
		}

		client->info(true) << "disconnected";
	}

	ServiceClient* createConnection(Socket* sock, SocketAddress& addr) {
		return nullptr;
	}

	bool deleteConnection(ServiceClient* client) {
		return false;
	}

	void handleMessage(ServiceClient* client, Packet* message);

	void processMessage(Message* message);

	bool handleError(ServiceClient* client, Exception& e) {
		return true;
	}

	void sendMessage(Message* msg) {
		client->sendPacket((BasePacket*) msg);
	}

	void sendMessage(StandaloneBaseMessage* msg) {
		client->sendPacket((BasePacket*) msg);

	#ifdef WITH_STM
		//TransactionalMemoryManager::commitPureTransaction();
	#endif
	}

	bool hasMessages() {
		return !messageQueue.isEmpty();
	}

	Message* getMessage() {
		return messageQueue.pop();
	}

	void setZone(Zone* zone) {
		ZoneClient::zone = zone;
	}

	void setAccountID(uint32 id) {
		accountID = id;
	}

	BaseClient* getClient() {
		return client;
	}

	Zone* getZone() {
		return zone;
	}

	uint32 getAccountID() {
		return accountID;
	}

	ZonePacketHandler* getZonePacketHandler() {
		return zonePacketHandler;
	}

	int getPacketCount() {
		return packetCount.get();
	}
};

#endif /* ZONECLIENT_H_ */
