#ifndef DELTAAUTOBITARRAY_H_
#define DELTAAUTOBITARRAY_H_

#include "DeltaBitArray.h"
#include "server/zone/packets/DeltaMessage.h"
#include "server/zone/objects/scene/SceneObject.h"
#include "server/zone/objects/ship/ShipDeltaVector.h"

template <class K, class V, int BaselineName, uint8 DeltaType, int DeltaIndex>
class DeltaAutoBitArray : public DeltaBitArray {
public:
	DeltaAutoBitArray() : DeltaBitArray() {

	}

	void update(const K& key, const V& value, bool notifyClient = false, SceneObject* sceneObject = nullptr, DeltaMessage* message = nullptr, ShipDeltaVector* vector = nullptr) {
		if (DeltaBitArray::getBitValue(key) != value) {
			DeltaBitArray::setBit(key, value);
		}

		if (message != nullptr) {
			addToDeltaMessage(message);
			return;
		}

		if (vector != nullptr) {
			addToDeltaMessage(vector);
			return;
		}

		if (sceneObject != nullptr && notifyClient) {
			broadcastStandaloneDeltaMessage(sceneObject);
			return;
		}
	}

	void broadcastStandaloneDeltaMessage(SceneObject* sceneObject) {
		auto message = getMessage(sceneObject, true);
		sceneObject->broadcastMessage(message, true);
	}

	void addToDeltaMessage(DeltaMessage* message) {
		message->startUpdate(DeltaIndex);
		DeltaBitArray::insertToMessage(message);
	}

	void addToDeltaMessage(ShipDeltaVector* vector) {
		auto message = vector->getMessage(DeltaType);

		if (message != nullptr) {
			addToDeltaMessage(message);
		}
	}

	DeltaMessage* getMessage(SceneObject* sceneObject, bool doClose = true) {
		auto message = new DeltaMessage(sceneObject->getObjectID(), BaselineName, DeltaType);
		addToDeltaMessage(message);

		if (doClose) {
			message->close();
		}

		return message;
	}
};

#endif // DELTAAUTOBITARRAY_H_
