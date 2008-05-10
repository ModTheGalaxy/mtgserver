/*
 *	server/zone/objects/tangible/firework/Firework.cpp generated by engine3 IDL compiler 0.55
 */

#include "Firework.h"

#include "FireworkImplementation.h"

#include "../../player/Player.h"

#include "../TangibleObject.h"

/*
 *	FireworkStub
 */

Firework::Firework(Player* player, unsigned int tempCRC, const unicode& n, const string& tempn) : TangibleObject(DummyConstructorParameter::instance()) {
	_impl = new FireworkImplementation(player, tempCRC, n, tempn);
	_impl->_setStub(this);
}

Firework::Firework(DummyConstructorParameter* param) : TangibleObject(param) {
}

Firework::~Firework() {
}

int Firework::useObject(Player* player) {
	if (_impl == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 6);
		method.addObjectParameter(player);

		return method.executeWithSignedIntReturn();
	} else
		return ((FireworkImplementation*) _impl)->useObject(player);
}

/*
 *	FireworkAdapter
 */

FireworkAdapter::FireworkAdapter(FireworkImplementation* obj) : TangibleObjectAdapter(obj) {
}

Packet* FireworkAdapter::invokeMethod(uint32 methid, DistributedMethod* inv) {
	Packet* resp = new MethodReturnMessage(0);

	switch (methid) {
	case 6:
		resp->insertSignedInt(useObject((Player*) inv->getObjectParameter()));
		break;
	default:
		return NULL;
	}

	return resp;
}

int FireworkAdapter::useObject(Player* player) {
	return ((FireworkImplementation*) impl)->useObject(player);
}

/*
 *	FireworkHelper
 */

FireworkHelper* FireworkHelper::staticInitializer = FireworkHelper::instance();

FireworkHelper::FireworkHelper() {
	className = "Firework";

	DistributedObjectBroker::instance()->registerClass(className, this);
}

void FireworkHelper::finalizeHelper() {
	FireworkHelper::finalize();
}

DistributedObject* FireworkHelper::instantiateObject() {
	return new Firework(DummyConstructorParameter::instance());
}

DistributedObjectAdapter* FireworkHelper::createAdapter(DistributedObjectStub* obj) {
	DistributedObjectAdapter* adapter = new FireworkAdapter((FireworkImplementation*) obj->_getImplementation());

	obj->_setClassName(className);
	obj->_setClassHelper(this);

	adapter->setStub(obj);

	return adapter;
}

/*
 *	FireworkServant
 */

FireworkServant::FireworkServant(unsigned long long oid, int tp) : TangibleObjectImplementation(oid, tp) {
	_classHelper = FireworkHelper::instance();
}

FireworkServant::~FireworkServant() {
}

void FireworkServant::_setStub(DistributedObjectStub* stub) {
	_this = (Firework*) stub;
	TangibleObjectServant::_setStub(stub);
}

DistributedObjectStub* FireworkServant::_getStub() {
	return _this;
}

