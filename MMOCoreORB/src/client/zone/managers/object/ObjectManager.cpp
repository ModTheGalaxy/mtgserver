/*
 * ObjectManager.cpp
 *
 *  Created on: Sep 5, 2009
 *      Author: theanswer
 */

#include "ObjectManager.h"
#include "client/zone/objects/scene/SceneObject.h"
#include "client/zone/objects/ObjectMap.h"

#include "client/zone/Zone.h"

ObjectFactory<SceneObject* (LuaObject*), uint32> ObjectManager::objectFactory;
Lua* ObjectManager::luaInstance = nullptr;
Mutex ObjectManager::luaMutex;

ObjectManager::ObjectManager() : Mutex("ObjectManager"), Logger("ObjectManager") {
	luaMutex.lock();

	if (luaInstance == nullptr) {
		luaInstance = new Lua();
		luaInstance->init();

		info("loading object templates...");
		registerFunctions();
		luaInstance->runFile("scripts/object/clientmain.lua");

		registerObjectTypes();
	}

	luaMutex.unlock();

	objectMap = new ObjectMap();

	zone = nullptr;
}

ObjectManager::~ObjectManager() {
	/*delete luaInstance;
	luaInstance = nullptr;*/

	delete objectMap;
	objectMap = nullptr;
}

void ObjectManager::registerObjectTypes() {
	info("registering object types");
	//objectFactory.registerObject<SceneObject>(0);

	/*objectFactory.registerObject<IntangibleObject>(SceneObject::INTANGIBLE);


	objectFactory.registerObject<Container>(SceneObject::CONTAINER);

	objectFactory.registerObject<CellObject>(SceneObject::CELLOBJECT);

	objectFactory.registerObject<WaypointObject>(SceneObject::WAYPOINT);

	objectFactory.registerObject<BuildingObject>(SceneObject::BUILDING);

	objectFactory.registerObject<WeaponObject>(SceneObject::WEAPON);
	objectFactory.registerObject<MeleeWeaponObject>(SceneObject::MELEEWEAPON);

	objectFactory.registerObject<MissionObject>(SceneObject::MISSIONOBJECT);


	objectFactory.registerObject<Terminal>(SceneObject::TERMINAL);
	objectFactory.registerObject<Terminal>(SceneObject::SPACETERMINAL);
	objectFactory.registerObject<Terminal>(SceneObject::SHIPPINGTERMINAL);
	objectFactory.registerObject<Terminal>(SceneObject::INTERACTIVETERMINAL);
	objectFactory.registerObject<StartingLocationTerminal>(SceneObject::NEWBIETUTORIALTERMINAL);


	//temporary
	objectFactory.registerObject<CreatureObject>(SceneObject::HOVERVEHICLE);*/

}

SceneObject* ObjectManager::createObject(uint32 objectCRC, uint64 objectID) {
	Locker _locker(this);

	SceneObject* object = nullptr;

	try {
		luaMutex.lock();

		LuaFunction getTemplate(luaInstance->getLuaState(), "getTemplate", 1);
		getTemplate << objectCRC; // push first argument
		getTemplate.callFunction();

		LuaObject result(luaInstance->getLuaState());

		if (!result.isValidTable()) {
			luaMutex.unlock();
			return nullptr;
		}

		uint32 gameObjectType = result.getIntField("gameObjectType");

		object = objectFactory.createObject(gameObjectType, &result);

		luaMutex.unlock();

		if (object == nullptr)
			return object;

		object->setObjectID(objectID);
		object->setZone(zone);

		StringBuffer logName;
		logName << object->getLoggingName() << " 0x" << hex << objectID;
		object->setLoggingName(logName.toString());

		objectMap->put(objectID, object);

	} catch (Exception& e) {
		error("exception caught in SceneObject* ObjectManager::loadObjectFromTemplate(uint32 objectCRC)");
		error(e.getMessage());

		e.printStackTrace();
	}

	return object;
}

SceneObject* ObjectManager::getObject(uint64 objectID) {
	Locker _locker(this);

	return objectMap->get(objectID);
}

SceneObject* ObjectManager::getObject(const UnicodeString& customName) {
	Locker _locker(this);

	HashTableIterator<uint64, Reference<SceneObject*> > iterator(objectMap);

	while (iterator.hasNext()) {
		SceneObject* object = iterator.next();

		String name = object->getObjectName();

		if (name == customName.toString())
			return object;
	}

	return nullptr;
}

void ObjectManager::registerFunctions() {
	//lua generic
	luaInstance->registerFunction("includeFile", includeFile);
	luaInstance->registerFunction("crcString", crcString);
	luaInstance->registerFunction("addTemplateCRC", addTemplateCRC);
}

int ObjectManager::includeFile(lua_State* L) {
	String filename = Lua::getStringParameter(L);

	Lua::runFile("scripts/object/" + filename, L);

	return 0;
}

int ObjectManager::crcString(lua_State* L) {
	String ascii = Lua::getStringParameter(L);

	uint32 crc = ascii.hashCode();

	lua_pushnumber(L, crc);

	return 1;
}

int ObjectManager::addTemplateCRC(lua_State* L) {
	/*String ascii =  lua_tostring(L, -2);
	uint32 value = (uint32) lua_tonumber(L, -1);

	uint32 crc = (uint32) ascii.hashCode();

	TemplateManager::instance()->addTemplate(crc, ascii);*/

	return 0;
}
