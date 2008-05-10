/*
 *	server/zone/objects/tangible/weapons/jedi/TwoHandedJediWeapon.cpp generated by engine3 IDL compiler 0.55
 */

#include "TwoHandedJediWeapon.h"

#include "TwoHandedJediWeaponImplementation.h"

#include "../../../creature/CreatureObject.h"

#include "../JediWeapon.h"

/*
 *	TwoHandedJediWeaponStub
 */

TwoHandedJediWeapon::TwoHandedJediWeapon(unsigned long long oid, unsigned int tempCRC, const unicode& n, const string& tempn, bool eqp) : JediWeapon(DummyConstructorParameter::instance()) {
	_impl = new TwoHandedJediWeaponImplementation(oid, tempCRC, n, tempn, eqp);
	_impl->_setStub(this);
}

TwoHandedJediWeapon::TwoHandedJediWeapon(CreatureObject* creature, const string& temp, const unicode& n, const string& tempn, bool eqp) : JediWeapon(DummyConstructorParameter::instance()) {
	_impl = new TwoHandedJediWeaponImplementation(creature, temp, n, tempn, eqp);
	_impl->_setStub(this);
}

TwoHandedJediWeapon::TwoHandedJediWeapon(DummyConstructorParameter* param) : JediWeapon(param) {
}

TwoHandedJediWeapon::~TwoHandedJediWeapon() {
}

/*
 *	TwoHandedJediWeaponAdapter
 */

TwoHandedJediWeaponAdapter::TwoHandedJediWeaponAdapter(TwoHandedJediWeaponImplementation* obj) : JediWeaponAdapter(obj) {
}

Packet* TwoHandedJediWeaponAdapter::invokeMethod(uint32 methid, DistributedMethod* inv) {
	Packet* resp = new MethodReturnMessage(0);

	switch (methid) {
	default:
		return NULL;
	}

	return resp;
}

/*
 *	TwoHandedJediWeaponHelper
 */

TwoHandedJediWeaponHelper* TwoHandedJediWeaponHelper::staticInitializer = TwoHandedJediWeaponHelper::instance();

TwoHandedJediWeaponHelper::TwoHandedJediWeaponHelper() {
	className = "TwoHandedJediWeapon";

	DistributedObjectBroker::instance()->registerClass(className, this);
}

void TwoHandedJediWeaponHelper::finalizeHelper() {
	TwoHandedJediWeaponHelper::finalize();
}

DistributedObject* TwoHandedJediWeaponHelper::instantiateObject() {
	return new TwoHandedJediWeapon(DummyConstructorParameter::instance());
}

DistributedObjectAdapter* TwoHandedJediWeaponHelper::createAdapter(DistributedObjectStub* obj) {
	DistributedObjectAdapter* adapter = new TwoHandedJediWeaponAdapter((TwoHandedJediWeaponImplementation*) obj->_getImplementation());

	obj->_setClassName(className);
	obj->_setClassHelper(this);

	adapter->setStub(obj);

	return adapter;
}

/*
 *	TwoHandedJediWeaponServant
 */

TwoHandedJediWeaponServant::TwoHandedJediWeaponServant(unsigned long long oid, unsigned int tempCRC, const unicode& n, const string& tempn, int tp, bool eqp) : JediWeaponImplementation(oid, tempCRC, n, tempn, tp, eqp) {
	_classHelper = TwoHandedJediWeaponHelper::instance();
}

TwoHandedJediWeaponServant::TwoHandedJediWeaponServant(CreatureObject* creature, const string& temp, const unicode& n, const string& tempn, int tp, bool eqp) : JediWeaponImplementation(creature, temp, n, tempn, tp, eqp) {
	_classHelper = TwoHandedJediWeaponHelper::instance();
}

TwoHandedJediWeaponServant::~TwoHandedJediWeaponServant() {
}

void TwoHandedJediWeaponServant::_setStub(DistributedObjectStub* stub) {
	_this = (TwoHandedJediWeapon*) stub;
	JediWeaponServant::_setStub(stub);
}

DistributedObjectStub* TwoHandedJediWeaponServant::_getStub() {
	return _this;
}

