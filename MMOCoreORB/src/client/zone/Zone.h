/*
 				Copyright <SWGEmu>
		See file COPYING for copying conditions. */

#ifndef ZONE_H_
#define ZONE_H_

#include "ZoneClient.h"
#include "client/zone/ZoneClientThread.h"
#include "engine/util/JSONSerializationType.h"

class ObjectController;
class ObjectManager;
class SceneObject;

class Zone : public Thread, public Mutex, public Logger {
	uint64 characterID;
	uint32 accountID;
	String sessionID;
	String galaxyAddress;
	uint32 galaxyPort;

	Reference<ZoneClient*> client;
	ZoneClientThread* clientThread;

	ObjectController* objectController;

	Condition characterCreatedCondition;
	Condition sceneReadyCondition;

	ObjectManager* objectManager;

	Time startTime;
	bool started;
	bool sceneReady;

public:
	Zone(uint64 characterObjectID, uint32 account, const String& sessionID, const String& galaxyAddress, uint32 galaxyPort);
	~Zone();

	void run();

	void disconnect() {
		if (client != nullptr) {
			client->disconnect();
			clientThread = nullptr;
		}
	}

	void setSceneStarted() {
		info(true) << __FUNCTION__ << " in " << startTime.miliDifference() << "ms";
	}

	void setSceneReady() {
		Locker locker(this);

		info(true) << __FUNCTION__ << " in " << startTime.miliDifference() << "ms";
		sceneReady = true;

		sceneReadyCondition.signal(this);
	}

	bool waitForSceneReady(int timeoutMs) {
		Locker locker(this);

		if (sceneReady) {
			return true;
		}

		Time timeout;
		timeout.addMiliTime(timeoutMs);
		bool success = !sceneReadyCondition.timedWait(this, &timeout);

		return success && sceneReady;
	}

	bool hasSelfPlayer() {
		return characterID != 0;
	}

	SceneObject* getObject(uint64 objid);

	void setCharacterID(uint64 val) {
		lock();

		if (characterID != 0 && val != characterID) {
			warning() << __FUNCTION__ << "(" << val << "): oid changing, current characterID=" << characterID;
		}

		characterID = val;

		characterCreatedCondition.signal(this);
		unlock();
	}

	inline uint64 getCharacterID() {
		return characterID;
	}

	inline const String& getGalaxyAddress() {
		return galaxyAddress;
	}

	inline uint32 getGalaxyPort() {
		return galaxyPort;
	}

	inline ZoneClient* getZoneClient() {
		return client;
	}

	inline ObjectManager* getObjectManager() {
		return objectManager;
	}

	inline ObjectController* getObjectController() {
		return objectController;
	}

	bool isStarted() {
		return started;
	}

	bool isSceneReady() {
		return sceneReady;
	}

	JSONSerializationType collectStats();
};

#endif /* ZONE_H_ */
