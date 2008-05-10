/*
 *	server/zone/objects/player/sui/listbox/SuiListBox.h generated by engine3 IDL compiler 0.55
 */

#ifndef SUILISTBOX_H_
#define SUILISTBOX_H_

#include "engine/orb/DistributedObjectBroker.h"

class SuiBox;

class Player;

#include "engine/service/proto/BaseMessage.h"

#include "../SuiBox.h"

class SuiListBox : public SuiBox {
public:
	SuiListBox(Player* player, unsigned int typeID, unsigned int boxtype = 0);

	void addMenuItem(const string& item, unsigned long long objectID = 0);

	int getMenuSize();

	unsigned long long getMenuObjectID(int idx);

	BaseMessage* generateMessage();

protected:
	SuiListBox(DummyConstructorParameter* param);

	virtual ~SuiListBox();

	friend class SuiListBoxHelper;
};

class SuiListBoxImplementation;

class SuiListBoxAdapter : public SuiBoxAdapter {
public:
	SuiListBoxAdapter(SuiListBoxImplementation* impl);

	Packet* invokeMethod(sys::uint32 methid, DistributedMethod* method);

	void addMenuItem(const string& item, unsigned long long objectID);

	int getMenuSize();

	unsigned long long getMenuObjectID(int idx);

	BaseMessage* generateMessage();

protected:
	string _param0_addMenuItem__string_long_;
};

class SuiListBoxHelper : public DistributedObjectClassHelper, public Singleton<SuiListBoxHelper> {
	static SuiListBoxHelper* staticInitializer;

public:
	SuiListBoxHelper();

	void finalizeHelper();

	DistributedObject* instantiateObject();

	DistributedObjectAdapter* createAdapter(DistributedObjectStub* obj);

	friend class SingletonWrapper<SuiListBoxHelper>;
};

#include "../SuiBoxImplementation.h"

class SuiListBoxServant : public SuiBoxImplementation {
public:
	SuiListBox* _this;

public:
	SuiListBoxServant(Player* player, unsigned int typeID, unsigned int boxtype);
	virtual ~SuiListBoxServant();

	void _setStub(DistributedObjectStub* stub);
	DistributedObjectStub* _getStub();

};

#endif /*SUILISTBOX_H_*/
