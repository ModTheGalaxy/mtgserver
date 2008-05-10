/*
 *	server/zone/objects/intangible/IntangibleObject.h generated by engine3 IDL compiler 0.55
 */

#ifndef INTANGIBLEOBJECT_H_
#define INTANGIBLEOBJECT_H_

#include "engine/orb/DistributedObjectBroker.h"

#include "engine/service/Message.h"

class SceneObject;

class Player;

#include "../scene/SceneObject.h"

class IntangibleObject : public SceneObject {
public:
	IntangibleObject(SceneObject* container, unsigned int objCRC, unsigned long long oid);

	void sendTo(Player* player, bool doClose = true);

	void sendDestroyTo(Player* player);

	void setName(const string& name);

	void setDetailName(const string& detail);

	void setWorldObject(SceneObject* obj);

	void updateStatus(unsigned int stat);

	string& getName();

	string& getDetailName();

	SceneObject* getWorldObject();

	unsigned int getStatus();

protected:
	IntangibleObject(DummyConstructorParameter* param);

	virtual ~IntangibleObject();

	string _return_getDetailName;
	string _return_getName;

	friend class IntangibleObjectHelper;
};

class IntangibleObjectImplementation;

class IntangibleObjectAdapter : public SceneObjectAdapter {
public:
	IntangibleObjectAdapter(IntangibleObjectImplementation* impl);

	Packet* invokeMethod(sys::uint32 methid, DistributedMethod* method);

	void sendTo(Player* player, bool doClose);

	void sendDestroyTo(Player* player);

	void setName(const string& name);

	void setDetailName(const string& detail);

	void setWorldObject(SceneObject* obj);

	void updateStatus(unsigned int stat);

	string& getName();

	string& getDetailName();

	SceneObject* getWorldObject();

	unsigned int getStatus();

protected:
	string _param0_setName__string_;
	string _param0_setDetailName__string_;
};

class IntangibleObjectHelper : public DistributedObjectClassHelper, public Singleton<IntangibleObjectHelper> {
	static IntangibleObjectHelper* staticInitializer;

public:
	IntangibleObjectHelper();

	void finalizeHelper();

	DistributedObject* instantiateObject();

	DistributedObjectAdapter* createAdapter(DistributedObjectStub* obj);

	friend class SingletonWrapper<IntangibleObjectHelper>;
};

#include "../scene/SceneObjectImplementation.h"

class IntangibleObjectServant : public SceneObjectImplementation {
public:
	IntangibleObject* _this;

public:
	IntangibleObjectServant(unsigned long long oid);
	virtual ~IntangibleObjectServant();

	void _setStub(DistributedObjectStub* stub);
	DistributedObjectStub* _getStub();

};

#endif /*INTANGIBLEOBJECT_H_*/
