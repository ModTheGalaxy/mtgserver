/*
 *	server/zone/objects/tangible/TangibleObject.cpp generated by engine3 IDL compiler 0.55
 */

#include "TangibleObject.h"

#include "TangibleObjectImplementation.h"

#include "../../Zone.h"

#include "../scene/SceneObject.h"

#include "../creature/CreatureObject.h"

#include "../player/Player.h"

/*
 *	TangibleObjectStub
 */

TangibleObject::TangibleObject(unsigned long long oid, int tp) : SceneObject(DummyConstructorParameter::instance()) {
	_impl = new TangibleObjectImplementation(oid, tp);
	_impl->_setStub(this);
}

TangibleObject::TangibleObject(unsigned long long oid, const unicode& n, const string& tempname, unsigned int tempCRC, int tp) : SceneObject(DummyConstructorParameter::instance()) {
	_impl = new TangibleObjectImplementation(oid, n, tempname, tempCRC, tp);
	_impl->_setStub(this);
}

TangibleObject::TangibleObject(CreatureObject* creature, const unicode& n, const string& tempname, unsigned int tempCRC, int tp) : SceneObject(DummyConstructorParameter::instance()) {
	_impl = new TangibleObjectImplementation(creature, n, tempname, tempCRC, tp);
	_impl->_setStub(this);
}

TangibleObject::TangibleObject(DummyConstructorParameter* param) : SceneObject(param) {
}

TangibleObject::~TangibleObject() {
}

void TangibleObject::insertToZone(Zone* zone) {
	if (_impl == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 6);
		method.addObjectParameter(zone);

		method.executeWithVoidReturn();
	} else
		((TangibleObjectImplementation*) _impl)->insertToZone(zone);
}

void TangibleObject::removeFromZone() {
	if (_impl == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 7);

		method.executeWithVoidReturn();
	} else
		((TangibleObjectImplementation*) _impl)->removeFromZone();
}

void TangibleObject::close(Player* player) {
	if (_impl == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 8);
		method.addObjectParameter(player);

		method.executeWithVoidReturn();
	} else
		((TangibleObjectImplementation*) _impl)->close(player);
}

void TangibleObject::setEquipped(bool eqp) {
	if (_impl == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 9);
		method.addBooleanParameter(eqp);

		method.executeWithVoidReturn();
	} else
		((TangibleObjectImplementation*) _impl)->setEquipped(eqp);
}

void TangibleObject::setContainer(SceneObject* cont, unsigned int type) {
	if (_impl == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 10);
		method.addObjectParameter(cont);
		method.addUnsignedIntParameter(type);

		method.executeWithVoidReturn();
	} else
		((TangibleObjectImplementation*) _impl)->setContainer(cont, type);
}

void TangibleObject::sendTo(Player* player, bool doClose) {
	if (_impl == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 11);
		method.addObjectParameter(player);
		method.addBooleanParameter(doClose);

		method.executeWithVoidReturn();
	} else
		((TangibleObjectImplementation*) _impl)->sendTo(player, doClose);
}

void TangibleObject::repairItem(Player* player) {
	if (_impl == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 12);
		method.addObjectParameter(player);

		method.executeWithVoidReturn();
	} else
		((TangibleObjectImplementation*) _impl)->repairItem(player);
}

void TangibleObject::decay(int decayRate) {
	if (_impl == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 13);
		method.addSignedIntParameter(decayRate);

		method.executeWithVoidReturn();
	} else
		((TangibleObjectImplementation*) _impl)->decay(decayRate);
}

void TangibleObject::parseItemAttributes() {
	if (_impl == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 14);

		method.executeWithVoidReturn();
	} else
		((TangibleObjectImplementation*) _impl)->parseItemAttributes();
}

bool TangibleObject::isPersistent() {
	if (_impl == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 15);

		return method.executeWithBooleanReturn();
	} else
		return ((TangibleObjectImplementation*) _impl)->isPersistent();
}

bool TangibleObject::isUpdated() {
	if (_impl == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 16);

		return method.executeWithBooleanReturn();
	} else
		return ((TangibleObjectImplementation*) _impl)->isUpdated();
}

bool TangibleObject::isEquipped() {
	if (_impl == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 17);

		return method.executeWithBooleanReturn();
	} else
		return ((TangibleObjectImplementation*) _impl)->isEquipped();
}

bool TangibleObject::isWeapon() {
	if (_impl == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 18);

		return method.executeWithBooleanReturn();
	} else
		return ((TangibleObjectImplementation*) _impl)->isWeapon();
}

bool TangibleObject::isArmor() {
	if (_impl == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 19);

		return method.executeWithBooleanReturn();
	} else
		return ((TangibleObjectImplementation*) _impl)->isArmor();
}

bool TangibleObject::isClothing() {
	if (_impl == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 20);

		return method.executeWithBooleanReturn();
	} else
		return ((TangibleObjectImplementation*) _impl)->isClothing();
}

bool TangibleObject::isInstrument() {
	if (_impl == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 21);

		return method.executeWithBooleanReturn();
	} else
		return ((TangibleObjectImplementation*) _impl)->isInstrument();
}

bool TangibleObject::isAttachment() {
	if (_impl == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 22);

		return method.executeWithBooleanReturn();
	} else
		return ((TangibleObjectImplementation*) _impl)->isAttachment();
}

bool TangibleObject::isResource() {
	if (_impl == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 23);

		return method.executeWithBooleanReturn();
	} else
		return ((TangibleObjectImplementation*) _impl)->isResource();
}

bool TangibleObject::isTicket() {
	if (_impl == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 24);

		return method.executeWithBooleanReturn();
	} else
		return ((TangibleObjectImplementation*) _impl)->isTicket();
}

bool TangibleObject::isTicketCollector() {
	if (_impl == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 25);

		return method.executeWithBooleanReturn();
	} else
		return ((TangibleObjectImplementation*) _impl)->isTicketCollector();
}

bool TangibleObject::isSurveyTool() {
	if (_impl == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 26);

		return method.executeWithBooleanReturn();
	} else
		return ((TangibleObjectImplementation*) _impl)->isSurveyTool();
}

bool TangibleObject::isLair() {
	if (_impl == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 27);

		return method.executeWithBooleanReturn();
	} else
		return ((TangibleObjectImplementation*) _impl)->isLair();
}

SceneObject* TangibleObject::getContainer() {
	if (_impl == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 28);

		return (SceneObject*) method.executeWithObjectReturn();
	} else
		return ((TangibleObjectImplementation*) _impl)->getContainer();
}

unicode& TangibleObject::getName() {
	if (_impl == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 29);

		method.executeWithUnicodeReturn(_return_getName);
		return _return_getName;
	} else
		return ((TangibleObjectImplementation*) _impl)->getName();
}

string& TangibleObject::getTemplateName() {
	if (_impl == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 30);

		method.executeWithAsciiReturn(_return_getTemplateName);
		return _return_getTemplateName;
	} else
		return ((TangibleObjectImplementation*) _impl)->getTemplateName();
}

string& TangibleObject::getTemplateTypeName() {
	if (_impl == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 31);

		method.executeWithAsciiReturn(_return_getTemplateTypeName);
		return _return_getTemplateTypeName;
	} else
		return ((TangibleObjectImplementation*) _impl)->getTemplateTypeName();
}

void TangibleObject::getCustomizationString(string& appearance) {
	if (_impl == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 32);
		method.addAsciiParameter(appearance);

		method.executeWithVoidReturn();
	} else
		((TangibleObjectImplementation*) _impl)->getCustomizationString(appearance);
}

int TangibleObject::getObjectSubType() {
	if (_impl == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 33);

		return method.executeWithSignedIntReturn();
	} else
		return ((TangibleObjectImplementation*) _impl)->getObjectSubType();
}

unsigned int TangibleObject::getTemplateID() {
	if (_impl == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 34);

		return method.executeWithUnsignedIntReturn();
	} else
		return ((TangibleObjectImplementation*) _impl)->getTemplateID();
}

int TangibleObject::getObjectCount() {
	if (_impl == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 35);

		return method.executeWithSignedIntReturn();
	} else
		return ((TangibleObjectImplementation*) _impl)->getObjectCount();
}

int TangibleObject::getConditionDamage() {
	if (_impl == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 36);

		return method.executeWithSignedIntReturn();
	} else
		return ((TangibleObjectImplementation*) _impl)->getConditionDamage();
}

int TangibleObject::getMaxCondition() {
	if (_impl == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 37);

		return method.executeWithSignedIntReturn();
	} else
		return ((TangibleObjectImplementation*) _impl)->getMaxCondition();
}

int TangibleObject::getCondition() {
	if (_impl == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 38);

		return method.executeWithSignedIntReturn();
	} else
		return ((TangibleObjectImplementation*) _impl)->getCondition();
}

void TangibleObject::setAttributes(string& attributestring) {
	if (_impl == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 39);
		method.addAsciiParameter(attributestring);

		method.executeWithVoidReturn();
	} else
		((TangibleObjectImplementation*) _impl)->setAttributes(attributestring);
}

string& TangibleObject::getAttributes() {
	if (_impl == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 40);

		method.executeWithAsciiReturn(_return_getAttributes);
		return _return_getAttributes;
	} else
		return ((TangibleObjectImplementation*) _impl)->getAttributes();
}

void TangibleObject::addAttributes(AttributeListMessage* alm) {
	if (_impl == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 41);
		method.addObjectParameter(alm);

		method.executeWithVoidReturn();
	} else
		((TangibleObjectImplementation*) _impl)->addAttributes(alm);
}

void TangibleObject::setName(const string& n) {
	if (_impl == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 42);
		method.addAsciiParameter(n);

		method.executeWithVoidReturn();
	} else
		((TangibleObjectImplementation*) _impl)->setName(n);
}

void TangibleObject::setTemplateName(const string& tempName) {
	if (_impl == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 43);
		method.addAsciiParameter(tempName);

		method.executeWithVoidReturn();
	} else
		((TangibleObjectImplementation*) _impl)->setTemplateName(tempName);
}

void TangibleObject::setTemplateTypeName(const string& tempTypeName) {
	if (_impl == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 44);
		method.addAsciiParameter(tempTypeName);

		method.executeWithVoidReturn();
	} else
		((TangibleObjectImplementation*) _impl)->setTemplateTypeName(tempTypeName);
}

void TangibleObject::setObjectSubType(const int type) {
	if (_impl == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 45);
		method.addSignedIntParameter(type);

		method.executeWithVoidReturn();
	} else
		((TangibleObjectImplementation*) _impl)->setObjectSubType(type);
}

void TangibleObject::setPersistent(bool pers) {
	if (_impl == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 46);
		method.addBooleanParameter(pers);

		method.executeWithVoidReturn();
	} else
		((TangibleObjectImplementation*) _impl)->setPersistent(pers);
}

void TangibleObject::setUpdated(bool upd) {
	if (_impl == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 47);
		method.addBooleanParameter(upd);

		method.executeWithVoidReturn();
	} else
		((TangibleObjectImplementation*) _impl)->setUpdated(upd);
}

void TangibleObject::setConditionDamage(int damage) {
	if (_impl == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 48);
		method.addSignedIntParameter(damage);

		method.executeWithVoidReturn();
	} else
		((TangibleObjectImplementation*) _impl)->setConditionDamage(damage);
}

void TangibleObject::setCustomizationString(string& cust) {
	if (_impl == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 49);
		method.addAsciiParameter(cust);

		method.executeWithVoidReturn();
	} else
		((TangibleObjectImplementation*) _impl)->setCustomizationString(cust);
}

void TangibleObject::setCustomizationVariable(unsigned char type, unsigned int value) {
	if (_impl == NULL) {
		if (!deployed)
			throw ObjectNotDeployedException(this);

		DistributedMethod method(this, 50);
		method.addUnsignedCharParameter(type);
		method.addUnsignedIntParameter(value);

		method.executeWithVoidReturn();
	} else
		((TangibleObjectImplementation*) _impl)->setCustomizationVariable(type, value);
}

/*
 *	TangibleObjectAdapter
 */

TangibleObjectAdapter::TangibleObjectAdapter(TangibleObjectImplementation* obj) : SceneObjectAdapter(obj) {
}

Packet* TangibleObjectAdapter::invokeMethod(uint32 methid, DistributedMethod* inv) {
	Packet* resp = new MethodReturnMessage(0);

	switch (methid) {
	case 6:
		insertToZone((Zone*) inv->getObjectParameter());
		break;
	case 7:
		removeFromZone();
		break;
	case 8:
		close((Player*) inv->getObjectParameter());
		break;
	case 9:
		setEquipped(inv->getBooleanParameter());
		break;
	case 10:
		setContainer((SceneObject*) inv->getObjectParameter(), inv->getUnsignedIntParameter());
		break;
	case 11:
		sendTo((Player*) inv->getObjectParameter(), inv->getBooleanParameter());
		break;
	case 12:
		repairItem((Player*) inv->getObjectParameter());
		break;
	case 13:
		decay(inv->getSignedIntParameter());
		break;
	case 14:
		parseItemAttributes();
		break;
	case 15:
		resp->insertBoolean(isPersistent());
		break;
	case 16:
		resp->insertBoolean(isUpdated());
		break;
	case 17:
		resp->insertBoolean(isEquipped());
		break;
	case 18:
		resp->insertBoolean(isWeapon());
		break;
	case 19:
		resp->insertBoolean(isArmor());
		break;
	case 20:
		resp->insertBoolean(isClothing());
		break;
	case 21:
		resp->insertBoolean(isInstrument());
		break;
	case 22:
		resp->insertBoolean(isAttachment());
		break;
	case 23:
		resp->insertBoolean(isResource());
		break;
	case 24:
		resp->insertBoolean(isTicket());
		break;
	case 25:
		resp->insertBoolean(isTicketCollector());
		break;
	case 26:
		resp->insertBoolean(isSurveyTool());
		break;
	case 27:
		resp->insertBoolean(isLair());
		break;
	case 28:
		resp->insertLong(getContainer()->_getObjectID());
		break;
	case 29:
		resp->insertUnicode(getName());
		break;
	case 30:
		resp->insertAscii(getTemplateName());
		break;
	case 31:
		resp->insertAscii(getTemplateTypeName());
		break;
	case 32:
		getCustomizationString(inv->getAsciiParameter(_param0_getCustomizationString__string_));
		break;
	case 33:
		resp->insertSignedInt(getObjectSubType());
		break;
	case 34:
		resp->insertInt(getTemplateID());
		break;
	case 35:
		resp->insertSignedInt(getObjectCount());
		break;
	case 36:
		resp->insertSignedInt(getConditionDamage());
		break;
	case 37:
		resp->insertSignedInt(getMaxCondition());
		break;
	case 38:
		resp->insertSignedInt(getCondition());
		break;
	case 39:
		setAttributes(inv->getAsciiParameter(_param0_setAttributes__string_));
		break;
	case 40:
		resp->insertAscii(getAttributes());
		break;
	case 41:
		addAttributes((AttributeListMessage*) inv->getObjectParameter());
		break;
	case 42:
		setName(inv->getAsciiParameter(_param0_setName__string_));
		break;
	case 43:
		setTemplateName(inv->getAsciiParameter(_param0_setTemplateName__string_));
		break;
	case 44:
		setTemplateTypeName(inv->getAsciiParameter(_param0_setTemplateTypeName__string_));
		break;
	case 45:
		setObjectSubType(inv->getSignedIntParameter());
		break;
	case 46:
		setPersistent(inv->getBooleanParameter());
		break;
	case 47:
		setUpdated(inv->getBooleanParameter());
		break;
	case 48:
		setConditionDamage(inv->getSignedIntParameter());
		break;
	case 49:
		setCustomizationString(inv->getAsciiParameter(_param0_setCustomizationString__string_));
		break;
	case 50:
		setCustomizationVariable(inv->getUnsignedCharParameter(), inv->getUnsignedIntParameter());
		break;
	default:
		return NULL;
	}

	return resp;
}

void TangibleObjectAdapter::insertToZone(Zone* zone) {
	return ((TangibleObjectImplementation*) impl)->insertToZone(zone);
}

void TangibleObjectAdapter::removeFromZone() {
	return ((TangibleObjectImplementation*) impl)->removeFromZone();
}

void TangibleObjectAdapter::close(Player* player) {
	return ((TangibleObjectImplementation*) impl)->close(player);
}

void TangibleObjectAdapter::setEquipped(bool eqp) {
	return ((TangibleObjectImplementation*) impl)->setEquipped(eqp);
}

void TangibleObjectAdapter::setContainer(SceneObject* cont, unsigned int type) {
	return ((TangibleObjectImplementation*) impl)->setContainer(cont, type);
}

void TangibleObjectAdapter::sendTo(Player* player, bool doClose) {
	return ((TangibleObjectImplementation*) impl)->sendTo(player, doClose);
}

void TangibleObjectAdapter::repairItem(Player* player) {
	return ((TangibleObjectImplementation*) impl)->repairItem(player);
}

void TangibleObjectAdapter::decay(int decayRate) {
	return ((TangibleObjectImplementation*) impl)->decay(decayRate);
}

void TangibleObjectAdapter::parseItemAttributes() {
	return ((TangibleObjectImplementation*) impl)->parseItemAttributes();
}

bool TangibleObjectAdapter::isPersistent() {
	return ((TangibleObjectImplementation*) impl)->isPersistent();
}

bool TangibleObjectAdapter::isUpdated() {
	return ((TangibleObjectImplementation*) impl)->isUpdated();
}

bool TangibleObjectAdapter::isEquipped() {
	return ((TangibleObjectImplementation*) impl)->isEquipped();
}

bool TangibleObjectAdapter::isWeapon() {
	return ((TangibleObjectImplementation*) impl)->isWeapon();
}

bool TangibleObjectAdapter::isArmor() {
	return ((TangibleObjectImplementation*) impl)->isArmor();
}

bool TangibleObjectAdapter::isClothing() {
	return ((TangibleObjectImplementation*) impl)->isClothing();
}

bool TangibleObjectAdapter::isInstrument() {
	return ((TangibleObjectImplementation*) impl)->isInstrument();
}

bool TangibleObjectAdapter::isAttachment() {
	return ((TangibleObjectImplementation*) impl)->isAttachment();
}

bool TangibleObjectAdapter::isResource() {
	return ((TangibleObjectImplementation*) impl)->isResource();
}

bool TangibleObjectAdapter::isTicket() {
	return ((TangibleObjectImplementation*) impl)->isTicket();
}

bool TangibleObjectAdapter::isTicketCollector() {
	return ((TangibleObjectImplementation*) impl)->isTicketCollector();
}

bool TangibleObjectAdapter::isSurveyTool() {
	return ((TangibleObjectImplementation*) impl)->isSurveyTool();
}

bool TangibleObjectAdapter::isLair() {
	return ((TangibleObjectImplementation*) impl)->isLair();
}

SceneObject* TangibleObjectAdapter::getContainer() {
	return ((TangibleObjectImplementation*) impl)->getContainer();
}

unicode& TangibleObjectAdapter::getName() {
	return ((TangibleObjectImplementation*) impl)->getName();
}

string& TangibleObjectAdapter::getTemplateName() {
	return ((TangibleObjectImplementation*) impl)->getTemplateName();
}

string& TangibleObjectAdapter::getTemplateTypeName() {
	return ((TangibleObjectImplementation*) impl)->getTemplateTypeName();
}

void TangibleObjectAdapter::getCustomizationString(string& appearance) {
	return ((TangibleObjectImplementation*) impl)->getCustomizationString(appearance);
}

int TangibleObjectAdapter::getObjectSubType() {
	return ((TangibleObjectImplementation*) impl)->getObjectSubType();
}

unsigned int TangibleObjectAdapter::getTemplateID() {
	return ((TangibleObjectImplementation*) impl)->getTemplateID();
}

int TangibleObjectAdapter::getObjectCount() {
	return ((TangibleObjectImplementation*) impl)->getObjectCount();
}

int TangibleObjectAdapter::getConditionDamage() {
	return ((TangibleObjectImplementation*) impl)->getConditionDamage();
}

int TangibleObjectAdapter::getMaxCondition() {
	return ((TangibleObjectImplementation*) impl)->getMaxCondition();
}

int TangibleObjectAdapter::getCondition() {
	return ((TangibleObjectImplementation*) impl)->getCondition();
}

void TangibleObjectAdapter::setAttributes(string& attributestring) {
	return ((TangibleObjectImplementation*) impl)->setAttributes(attributestring);
}

string& TangibleObjectAdapter::getAttributes() {
	return ((TangibleObjectImplementation*) impl)->getAttributes();
}

void TangibleObjectAdapter::addAttributes(AttributeListMessage* alm) {
	return ((TangibleObjectImplementation*) impl)->addAttributes(alm);
}

void TangibleObjectAdapter::setName(const string& n) {
	return ((TangibleObjectImplementation*) impl)->setName(n);
}

void TangibleObjectAdapter::setTemplateName(const string& tempName) {
	return ((TangibleObjectImplementation*) impl)->setTemplateName(tempName);
}

void TangibleObjectAdapter::setTemplateTypeName(const string& tempTypeName) {
	return ((TangibleObjectImplementation*) impl)->setTemplateTypeName(tempTypeName);
}

void TangibleObjectAdapter::setObjectSubType(const int type) {
	return ((TangibleObjectImplementation*) impl)->setObjectSubType(type);
}

void TangibleObjectAdapter::setPersistent(bool pers) {
	return ((TangibleObjectImplementation*) impl)->setPersistent(pers);
}

void TangibleObjectAdapter::setUpdated(bool upd) {
	return ((TangibleObjectImplementation*) impl)->setUpdated(upd);
}

void TangibleObjectAdapter::setConditionDamage(int damage) {
	return ((TangibleObjectImplementation*) impl)->setConditionDamage(damage);
}

void TangibleObjectAdapter::setCustomizationString(string& cust) {
	return ((TangibleObjectImplementation*) impl)->setCustomizationString(cust);
}

void TangibleObjectAdapter::setCustomizationVariable(unsigned char type, unsigned int value) {
	return ((TangibleObjectImplementation*) impl)->setCustomizationVariable(type, value);
}

/*
 *	TangibleObjectHelper
 */

TangibleObjectHelper* TangibleObjectHelper::staticInitializer = TangibleObjectHelper::instance();

TangibleObjectHelper::TangibleObjectHelper() {
	className = "TangibleObject";

	DistributedObjectBroker::instance()->registerClass(className, this);
}

void TangibleObjectHelper::finalizeHelper() {
	TangibleObjectHelper::finalize();
}

DistributedObject* TangibleObjectHelper::instantiateObject() {
	return new TangibleObject(DummyConstructorParameter::instance());
}

DistributedObjectAdapter* TangibleObjectHelper::createAdapter(DistributedObjectStub* obj) {
	DistributedObjectAdapter* adapter = new TangibleObjectAdapter((TangibleObjectImplementation*) obj->_getImplementation());

	obj->_setClassName(className);
	obj->_setClassHelper(this);

	adapter->setStub(obj);

	return adapter;
}

/*
 *	TangibleObjectServant
 */

TangibleObjectServant::TangibleObjectServant() : SceneObjectImplementation() {
	_classHelper = TangibleObjectHelper::instance();
}

TangibleObjectServant::TangibleObjectServant(unsigned long long oid) : SceneObjectImplementation(oid) {
	_classHelper = TangibleObjectHelper::instance();
}

TangibleObjectServant::~TangibleObjectServant() {
}

void TangibleObjectServant::_setStub(DistributedObjectStub* stub) {
	_this = (TangibleObject*) stub;
	SceneObjectServant::_setStub(stub);
}

DistributedObjectStub* TangibleObjectServant::_getStub() {
	return _this;
}

