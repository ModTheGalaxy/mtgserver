/*
 *	server/zone/objects/player/sui/colorpicker/SuiColorPicker.cpp generated by engine3 IDL compiler 0.55
 */

#include "SuiColorPicker.h"

#include "SuiColorPickerImplementation.h"

#include "../SuiBox.h"

#include "../../Player.h"

/*
 *	SuiColorPickerStub
 */

SuiColorPicker::SuiColorPicker(Player* player, unsigned int typeID, unsigned int boxtype) : SuiBox(DummyConstructorParameter::instance()) {
	_impl = new SuiColorPickerImplementation(player, typeID, boxtype);
	_impl->_setStub(this);
}

SuiColorPicker::SuiColorPicker(DummyConstructorParameter* param) : SuiBox(param) {
}

SuiColorPicker::~SuiColorPicker() {
}

unsigned long long SuiColorPicker::getObjectID() {
	if (_impl == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 6);

		return method.executeWithUnsignedLongReturn();
	} else
		return ((SuiColorPickerImplementation*) _impl)->getObjectID();
}

BaseMessage* SuiColorPicker::generateMessage() {
	if (_impl == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 7);

		return (BaseMessage*) method.executeWithObjectReturn();
	} else
		return ((SuiColorPickerImplementation*) _impl)->generateMessage();
}

/*
 *	SuiColorPickerAdapter
 */

SuiColorPickerAdapter::SuiColorPickerAdapter(SuiColorPickerImplementation* obj) : SuiBoxAdapter(obj) {
}

Packet* SuiColorPickerAdapter::invokeMethod(uint32 methid, DistributedMethod* inv) {
	Packet* resp = new MethodReturnMessage(0);

	switch (methid) {
	case 6:
		resp->insertLong(getObjectID());
		break;
	case 7:
		resp->insertLong(generateMessage()->_getObjectID());
		break;
	default:
		return NULL;
	}

	return resp;
}

unsigned long long SuiColorPickerAdapter::getObjectID() {
	return ((SuiColorPickerImplementation*) impl)->getObjectID();
}

BaseMessage* SuiColorPickerAdapter::generateMessage() {
	return ((SuiColorPickerImplementation*) impl)->generateMessage();
}

/*
 *	SuiColorPickerHelper
 */

SuiColorPickerHelper* SuiColorPickerHelper::staticInitializer = SuiColorPickerHelper::instance();

SuiColorPickerHelper::SuiColorPickerHelper() {
	className = "SuiColorPicker";

	DistributedObjectBroker::instance()->registerClass(className, this);
}

void SuiColorPickerHelper::finalizeHelper() {
	SuiColorPickerHelper::finalize();
}

DistributedObject* SuiColorPickerHelper::instantiateObject() {
	return new SuiColorPicker(DummyConstructorParameter::instance());
}

DistributedObjectAdapter* SuiColorPickerHelper::createAdapter(DistributedObjectStub* obj) {
	DistributedObjectAdapter* adapter = new SuiColorPickerAdapter((SuiColorPickerImplementation*) obj->_getImplementation());

	obj->_setClassName(className);
	obj->_setClassHelper(this);

	adapter->setStub(obj);

	return adapter;
}

/*
 *	SuiColorPickerServant
 */

SuiColorPickerServant::SuiColorPickerServant(Player* player, unsigned int typeID, unsigned int boxtype) : SuiBoxImplementation(player, typeID, boxtype) {
	_classHelper = SuiColorPickerHelper::instance();
}

SuiColorPickerServant::~SuiColorPickerServant() {
}

void SuiColorPickerServant::_setStub(DistributedObjectStub* stub) {
	_this = (SuiColorPicker*) stub;
	SuiBoxServant::_setStub(stub);
}

DistributedObjectStub* SuiColorPickerServant::_getStub() {
	return _this;
}

