/*
 *	server/zone/objects/tangible/attachment/Attachment.h generated by engine3 IDL compiler 0.55
 */

#ifndef ATTACHMENT_H_
#define ATTACHMENT_H_

#include "engine/orb/DistributedObjectBroker.h"

class TangibleObject;

class CreatureObject;

class Player;

#include "engine/service/Message.h"

#include "../TangibleObject.h"

class Attachment : public TangibleObject {
public:
	Attachment(unsigned long long objID, int attachmentType);

	void remove(Player* player);

	void setSkillMod0Type(int type);

	void setSkillMod1Type(int type);

	void setSkillMod2Type(int type);

	void setSkillMod0Value(int value);

	void setSkillMod1Value(int value);

	void setSkillMod2Value(int value);

	void setSkillModValue(int index, int value);

	void setSkillModType(int index, int type);

	void setSkillMods(int modifier);

	int getSkillMod0Type();

	int getSkillMod1Type();

	int getSkillMod2Type();

	int getSkillMod0Value();

	int getSkillMod1Value();

	int getSkillMod2Value();

	int getSkillModType(int index);

	int getSkillModValue(int index);

	int getBestSkillMod();

protected:
	Attachment(DummyConstructorParameter* param);

	virtual ~Attachment();

	friend class AttachmentHelper;
};

class AttachmentImplementation;

class AttachmentAdapter : public TangibleObjectAdapter {
public:
	AttachmentAdapter(AttachmentImplementation* impl);

	Packet* invokeMethod(sys::uint32 methid, DistributedMethod* method);

	void remove(Player* player);

	void setSkillMod0Type(int type);

	void setSkillMod1Type(int type);

	void setSkillMod2Type(int type);

	void setSkillMod0Value(int value);

	void setSkillMod1Value(int value);

	void setSkillMod2Value(int value);

	void setSkillModValue(int index, int value);

	void setSkillModType(int index, int type);

	void setSkillMods(int modifier);

	int getSkillMod0Type();

	int getSkillMod1Type();

	int getSkillMod2Type();

	int getSkillMod0Value();

	int getSkillMod1Value();

	int getSkillMod2Value();

	int getSkillModType(int index);

	int getSkillModValue(int index);

	int getBestSkillMod();

};

class AttachmentHelper : public DistributedObjectClassHelper, public Singleton<AttachmentHelper> {
	static AttachmentHelper* staticInitializer;

public:
	AttachmentHelper();

	void finalizeHelper();

	DistributedObject* instantiateObject();

	DistributedObjectAdapter* createAdapter(DistributedObjectStub* obj);

	friend class SingletonWrapper<AttachmentHelper>;
};

#include "../TangibleObjectImplementation.h"

class AttachmentServant : public TangibleObjectImplementation {
public:
	Attachment* _this;

public:
	AttachmentServant(unsigned long long objID, int attachmentType);
	virtual ~AttachmentServant();

	void _setStub(DistributedObjectStub* stub);
	DistributedObjectStub* _getStub();

};

#endif /*ATTACHMENT_H_*/
