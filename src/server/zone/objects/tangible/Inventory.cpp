/*
 *	server/zone/objects/tangible/Inventory.cpp generated by engine3 IDL compiler 0.55
 */

#include "Inventory.h"

#include "InventoryImplementation.h"

#include "Container.h"

#include "../creature/CreatureObject.h"

/*
 *	InventoryStub
 */

Inventory::Inventory(CreatureObject* creature) : Container(DummyConstructorParameter::instance()) {
	_impl = new InventoryImplementation(creature);
	_impl->_setStub(this);
}

Inventory::Inventory(DummyConstructorParameter* param) : Container(param) {
}

Inventory::~Inventory() {
}

/*
 *	InventoryAdapter
 */

InventoryAdapter::InventoryAdapter(InventoryImplementation* obj) : ContainerAdapter(obj) {
}

Packet* InventoryAdapter::invokeMethod(uint32 methid, DistributedMethod* inv) {
	Packet* resp = new MethodReturnMessage(0);

	switch (methid) {
	default:
		return NULL;
	}

	return resp;
}

/*
 *	InventoryHelper
 */

InventoryHelper* InventoryHelper::staticInitializer = InventoryHelper::instance();

InventoryHelper::InventoryHelper() {
	className = "Inventory";

	DistributedObjectBroker::instance()->registerClass(className, this);
}

void InventoryHelper::finalizeHelper() {
	InventoryHelper::finalize();
}

DistributedObject* InventoryHelper::instantiateObject() {
	return new Inventory(DummyConstructorParameter::instance());
}

DistributedObjectAdapter* InventoryHelper::createAdapter(DistributedObjectStub* obj) {
	DistributedObjectAdapter* adapter = new InventoryAdapter((InventoryImplementation*) obj->_getImplementation());

	obj->_setClassName(className);
	obj->_setClassHelper(this);

	adapter->setStub(obj);

	return adapter;
}

/*
 *	InventoryServant
 */

InventoryServant::InventoryServant(unsigned long long oid) : ContainerImplementation(oid) {
	_classHelper = InventoryHelper::instance();
}

InventoryServant::~InventoryServant() {
}

void InventoryServant::_setStub(DistributedObjectStub* stub) {
	_this = (Inventory*) stub;
	ContainerServant::_setStub(stub);
}

DistributedObjectStub* InventoryServant::_getStub() {
	return _this;
}

