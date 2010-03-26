/*
 *	server/zone/objects/tangible/wearables/ArmorObject.cpp generated by engine3 IDL compiler 0.60
 */

#include "ArmorObject.h"

/*
 *	ArmorObjectStub
 */

ArmorObject::ArmorObject() : WearableObject(DummyConstructorParameter::instance()) {
	_impl = new ArmorObjectImplementation();
	_impl->_setStub(this);
}

ArmorObject::ArmorObject(DummyConstructorParameter* param) : WearableObject(param) {
}

ArmorObject::~ArmorObject() {
}


void ArmorObject::initializeTransientMembers() {
	if (_impl == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 6);

		method.executeWithVoidReturn();
	} else
		((ArmorObjectImplementation*) _impl)->initializeTransientMembers();
}

void ArmorObject::fillAttributeList(AttributeListMessage* msg, PlayerCreature* object) {
	if (_impl == NULL) {
		throw ObjectNotLocalException(this);

	} else
		((ArmorObjectImplementation*) _impl)->fillAttributeList(msg, object);
}

bool ArmorObject::isSpecial(const String& special) {
	if (_impl == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 7);
		method.addAsciiParameter(special);

		return method.executeWithBooleanReturn();
	} else
		return ((ArmorObjectImplementation*) _impl)->isSpecial(special);
}

bool ArmorObject::isVulnerable(const String& vulnerability) {
	if (_impl == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 8);
		method.addAsciiParameter(vulnerability);

		return method.executeWithBooleanReturn();
	} else
		return ((ArmorObjectImplementation*) _impl)->isVulnerable(vulnerability);
}

/*
 *	ArmorObjectImplementation
 */

ArmorObjectImplementation::ArmorObjectImplementation(DummyConstructorParameter* param) : WearableObjectImplementation(param) {
	_initializeImplementation();
}

ArmorObjectImplementation::~ArmorObjectImplementation() {
}


void ArmorObjectImplementation::finalize() {
}

void ArmorObjectImplementation::_initializeImplementation() {
	_setClassHelper(ArmorObjectHelper::instance());

	_serializationHelperMethod();
}

void ArmorObjectImplementation::_setStub(DistributedObjectStub* stub) {
	_this = (ArmorObject*) stub;
	WearableObjectImplementation::_setStub(stub);
}

DistributedObjectStub* ArmorObjectImplementation::_getStub() {
	return _this;
}

ArmorObjectImplementation::operator const ArmorObject*() {
	return _this;
}

void ArmorObjectImplementation::lock(bool doLock) {
	_this->lock(doLock);
}

void ArmorObjectImplementation::lock(ManagedObject* obj) {
	_this->lock(obj);
}

void ArmorObjectImplementation::rlock(bool doLock) {
	_this->rlock(doLock);
}

void ArmorObjectImplementation::wlock(bool doLock) {
	_this->wlock(doLock);
}

void ArmorObjectImplementation::wlock(ManagedObject* obj) {
	_this->wlock(obj);
}

void ArmorObjectImplementation::unlock(bool doLock) {
	_this->unlock(doLock);
}

void ArmorObjectImplementation::runlock(bool doLock) {
	_this->runlock(doLock);
}

void ArmorObjectImplementation::_serializationHelperMethod() {
	WearableObjectImplementation::_serializationHelperMethod();

	_setClassName("ArmorObject");

	addSerializableVariable("healthEncumbrance", &healthEncumbrance);
	addSerializableVariable("actionEncumbrance", &actionEncumbrance);
	addSerializableVariable("mindEncumbrance", &mindEncumbrance);
	addSerializableVariable("rating", &rating);
	addSerializableVariable("kinetic", &kinetic);
	addSerializableVariable("energy", &energy);
	addSerializableVariable("electricity", &electricity);
	addSerializableVariable("stun", &stun);
	addSerializableVariable("blast", &blast);
	addSerializableVariable("heat", &heat);
	addSerializableVariable("cold", &cold);
	addSerializableVariable("acid", &acid);
	addSerializableVariable("lightSaber", &lightSaber);
	addSerializableVariable("specialResistsVector", &specialResistsVector);
	addSerializableVariable("vulnerabilitesVector", &vulnerabilitesVector);
	addSerializableVariable("specialBase", &specialBase);
}

ArmorObjectImplementation::ArmorObjectImplementation() {
	_initializeImplementation();
	// server/zone/objects/tangible/wearables/ArmorObject.idl(80):  		healthEncumbrance = 100;
	healthEncumbrance = 100;
	// server/zone/objects/tangible/wearables/ArmorObject.idl(81):  		actionEncumbrance = 100;
	actionEncumbrance = 100;
	// server/zone/objects/tangible/wearables/ArmorObject.idl(82):  		mindEncumbrance = 100;
	mindEncumbrance = 100;
	// server/zone/objects/tangible/wearables/ArmorObject.idl(84):  		rating = LIGHT;
	rating = LIGHT;
	// server/zone/objects/tangible/wearables/ArmorObject.idl(86):  		kinetic = 0;
	kinetic = 0;
	// server/zone/objects/tangible/wearables/ArmorObject.idl(87):  		energy = 0;
	energy = 0;
	// server/zone/objects/tangible/wearables/ArmorObject.idl(88):  		electricity = 0;
	electricity = 0;
	// server/zone/objects/tangible/wearables/ArmorObject.idl(89):  		stun = 0;
	stun = 0;
	// server/zone/objects/tangible/wearables/ArmorObject.idl(90):  		blast = 0;
	blast = 0;
	// server/zone/objects/tangible/wearables/ArmorObject.idl(91):  		heat = 0;
	heat = 0;
	// server/zone/objects/tangible/wearables/ArmorObject.idl(92):  		cold = 0;
	cold = 0;
	// server/zone/objects/tangible/wearables/ArmorObject.idl(93):  		acid = 0;
	acid = 0;
	// server/zone/objects/tangible/wearables/ArmorObject.idl(94):  		lightSaber = 0;
	lightSaber = 0;
	// server/zone/objects/tangible/wearables/ArmorObject.idl(100):  		Logger.setLoggingName("ArmorObject");
	Logger::setLoggingName("ArmorObject");
}

bool ArmorObjectImplementation::isSpecial(const String& special) {
	// server/zone/objects/tangible/wearables/ArmorObject.idl(116):  		return specialResistsVector.contains(special);
	return (&specialResistsVector)->contains(special);
}

bool ArmorObjectImplementation::isVulnerable(const String& vulnerability) {
	// server/zone/objects/tangible/wearables/ArmorObject.idl(120):  		return vulnerabilitesVector.contains(vulnerability);
	return (&vulnerabilitesVector)->contains(vulnerability);
}

/*
 *	ArmorObjectAdapter
 */

ArmorObjectAdapter::ArmorObjectAdapter(ArmorObjectImplementation* obj) : WearableObjectAdapter(obj) {
}

Packet* ArmorObjectAdapter::invokeMethod(uint32 methid, DistributedMethod* inv) {
	Packet* resp = new MethodReturnMessage(0);

	switch (methid) {
	case 6:
		initializeTransientMembers();
		break;
	case 7:
		resp->insertBoolean(isSpecial(inv->getAsciiParameter(_param0_isSpecial__String_)));
		break;
	case 8:
		resp->insertBoolean(isVulnerable(inv->getAsciiParameter(_param0_isVulnerable__String_)));
		break;
	default:
		return NULL;
	}

	return resp;
}

void ArmorObjectAdapter::initializeTransientMembers() {
	((ArmorObjectImplementation*) impl)->initializeTransientMembers();
}

bool ArmorObjectAdapter::isSpecial(const String& special) {
	return ((ArmorObjectImplementation*) impl)->isSpecial(special);
}

bool ArmorObjectAdapter::isVulnerable(const String& vulnerability) {
	return ((ArmorObjectImplementation*) impl)->isVulnerable(vulnerability);
}

/*
 *	ArmorObjectHelper
 */

ArmorObjectHelper* ArmorObjectHelper::staticInitializer = ArmorObjectHelper::instance();

ArmorObjectHelper::ArmorObjectHelper() {
	className = "ArmorObject";

	DistributedObjectBroker::instance()->registerClass(className, this);
}

void ArmorObjectHelper::finalizeHelper() {
	ArmorObjectHelper::finalize();
}

DistributedObject* ArmorObjectHelper::instantiateObject() {
	return new ArmorObject(DummyConstructorParameter::instance());
}

DistributedObjectServant* ArmorObjectHelper::instantiateServant() {
	return new ArmorObjectImplementation(DummyConstructorParameter::instance());
}

DistributedObjectAdapter* ArmorObjectHelper::createAdapter(DistributedObjectStub* obj) {
	DistributedObjectAdapter* adapter = new ArmorObjectAdapter((ArmorObjectImplementation*) obj->_getImplementation());

	obj->_setClassName(className);
	obj->_setClassHelper(this);

	adapter->setStub(obj);

	return adapter;
}

