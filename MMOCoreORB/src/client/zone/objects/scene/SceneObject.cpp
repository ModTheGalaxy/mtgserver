#include "SceneObject.h"

SceneObject::SceneObject(LuaObject* templateData) : Logger("SceneObject") {
	parent = nullptr;

	objectID = 0;

	slottedObjects.setNullValue(nullptr);
	objectName = templateData->getStringField("objectName");

	detailedDescription = templateData->getStringField("detailedDescription");

	containerType = templateData->getIntField("containerType");
	containerVolumeLimit = templateData->getIntField("containerVolumeLimit");

	gameObjectType = templateData->getIntField("gameObjectType");

	objectCRC = templateData->getIntField("clientObjectCRC");

	LuaObject arrangements = templateData->getObjectField("arrangementDescriptors");

	for (int i = 1; i <= arrangements.getTableSize(); ++i) {
		arrangementDescriptors.add(arrangements.getStringAt(i));
	}

	arrangements.pop();

	LuaObject slots = templateData->getObjectField("slotDescriptors");

	for (int i = 1; i <= slots.getTableSize(); ++i) {
		slotDescriptors.add(slots.getStringAt(i));
	}

	slots.pop();

	containmentType = 4;

	initializePosition(0.f, 0.f, 0.f);

	movementCounter = 0;

	setGlobalLogging(true);
	setLogging(false);

	String fullPath;

	client = nullptr;
	zone = nullptr;

	info("created " + fullPath);
}

SceneObject::~SceneObject() {
	/*if (parent != nullptr) {
		error("DELETING OBJECT WITH PARENT NOT NULL");
	}*/
	info("destroying object");

	if (slottedObjects.size() > 0)
		info("warning slottedObjects not 0 when destroying");

	if (containerObjects.size() > 0)
		info("warning slottedObjects not 0 when destroying");

	/*while (slottedObjects.size() > 0) {
		SceneObject* object = slottedObjects.get(0);

		removeObject(object);

		object->setParent(nullptr);

		zone->getObjectManager()->destroyObject(object->getObjectID());
	}


	while (containerObjects.size() > 0) {
		SceneObject* object = containerObjects.get(0);
		object->setParent(nullptr);

		containerObjects.drop(object->getObjectID());

		zone->getObjectManager()->destroyObject(object->getObjectID());
	}*/
}

