/*
 *	server/zone/objects/building/cell/CellObject.cpp generated by engine3 IDL compiler 0.55
 */

#include "CellObject.h"

#include "CellObjectImplementation.h"

#include "../../../Zone.h"

#include "../../scene/SceneObject.h"

#include "../../player/Player.h"

#include "../BuildingObject.h"

/*
 *	CellObjectStub
 */

CellObject::CellObject(unsigned long long oid, BuildingObject* buio) : SceneObject(DummyConstructorParameter::instance()) {
	_impl = new CellObjectImplementation(oid, buio);
	_impl->_setStub(this);
}

CellObject::CellObject(DummyConstructorParameter* param) : SceneObject(param) {
}

CellObject::~CellObject() {
}

void CellObject::insertToZone(Zone* zone) {
	if (_impl == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 6);
		method.addObjectParameter(zone);

		method.executeWithVoidReturn();
	} else
		((CellObjectImplementation*) _impl)->insertToZone(zone);
}

void CellObject::addChild(SceneObject* object, bool doLock) {
	if (_impl == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 7);
		method.addObjectParameter(object);
		method.addBooleanParameter(doLock);

		method.executeWithVoidReturn();
	} else
		((CellObjectImplementation*) _impl)->addChild(object, doLock);
}

void CellObject::removeChild(SceneObject* object, bool doLock) {
	if (_impl == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 8);
		method.addObjectParameter(object);
		method.addBooleanParameter(doLock);

		method.executeWithVoidReturn();
	} else
		((CellObjectImplementation*) _impl)->removeChild(object, doLock);
}

SceneObject* CellObject::getChild(int idx) {
	if (_impl == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 9);
		method.addSignedIntParameter(idx);

		return (SceneObject*) method.executeWithObjectReturn();
	} else
		return ((CellObjectImplementation*) _impl)->getChild(idx);
}

int CellObject::getChildrenSize() {
	if (_impl == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 10);

		return method.executeWithSignedIntReturn();
	} else
		return ((CellObjectImplementation*) _impl)->getChildrenSize();
}

/*
 *	CellObjectAdapter
 */

CellObjectAdapter::CellObjectAdapter(CellObjectImplementation* obj) : SceneObjectAdapter(obj) {
}

Packet* CellObjectAdapter::invokeMethod(uint32 methid, DistributedMethod* inv) {
	Packet* resp = new MethodReturnMessage(0);

	switch (methid) {
	case 6:
		insertToZone((Zone*) inv->getObjectParameter());
		break;
	case 7:
		addChild((SceneObject*) inv->getObjectParameter(), inv->getBooleanParameter());
		break;
	case 8:
		removeChild((SceneObject*) inv->getObjectParameter(), inv->getBooleanParameter());
		break;
	case 9:
		resp->insertLong(getChild(inv->getSignedIntParameter())->_getObjectID());
		break;
	case 10:
		resp->insertSignedInt(getChildrenSize());
		break;
	default:
		return NULL;
	}

	return resp;
}

void CellObjectAdapter::insertToZone(Zone* zone) {
	return ((CellObjectImplementation*) impl)->insertToZone(zone);
}

void CellObjectAdapter::addChild(SceneObject* object, bool doLock) {
	return ((CellObjectImplementation*) impl)->addChild(object, doLock);
}

void CellObjectAdapter::removeChild(SceneObject* object, bool doLock) {
	return ((CellObjectImplementation*) impl)->removeChild(object, doLock);
}

SceneObject* CellObjectAdapter::getChild(int idx) {
	return ((CellObjectImplementation*) impl)->getChild(idx);
}

int CellObjectAdapter::getChildrenSize() {
	return ((CellObjectImplementation*) impl)->getChildrenSize();
}

/*
 *	CellObjectHelper
 */

CellObjectHelper* CellObjectHelper::staticInitializer = CellObjectHelper::instance();

CellObjectHelper::CellObjectHelper() {
	className = "CellObject";

	DistributedObjectBroker::instance()->registerClass(className, this);
}

void CellObjectHelper::finalizeHelper() {
	CellObjectHelper::finalize();
}

DistributedObject* CellObjectHelper::instantiateObject() {
	return new CellObject(DummyConstructorParameter::instance());
}

DistributedObjectAdapter* CellObjectHelper::createAdapter(DistributedObjectStub* obj) {
	DistributedObjectAdapter* adapter = new CellObjectAdapter((CellObjectImplementation*) obj->_getImplementation());

	obj->_setClassName(className);
	obj->_setClassHelper(this);

	adapter->setStub(obj);

	return adapter;
}

/*
 *	CellObjectServant
 */

CellObjectServant::CellObjectServant(unsigned long long oid) : SceneObjectImplementation(oid) {
	_classHelper = CellObjectHelper::instance();
}

CellObjectServant::~CellObjectServant() {
}

void CellObjectServant::_setStub(DistributedObjectStub* stub) {
	_this = (CellObject*) stub;
	SceneObjectServant::_setStub(stub);
}

DistributedObjectStub* CellObjectServant::_getStub() {
	return _this;
}

