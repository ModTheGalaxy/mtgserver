/*
 *	server/zone/objects/tangible/terminal/bazaar/RegionBazaar.h generated by engine3 IDL compiler 0.55
 */

#ifndef REGIONBAZAAR_H_
#define REGIONBAZAAR_H_

#include "engine/orb/DistributedObjectBroker.h"

class Player;

class SceneObject;

class AuctionItem;

class BazaarPlanetManager;

#include "../../../scene/SceneObject.h"

class RegionBazaar : public SceneObject {
public:
	RegionBazaar();

	void addItem(AuctionItem* item);

	bool removeItem(long long objectid);

	void setRegion(string& region);

	void setManager(BazaarPlanetManager* manager);

	void newBazaarRequest(long long bazaarID, Player* player, int planet);

	void getBazaarData(Player* player, long long objectid, int screen, int extent, int category, int count, int offset);

protected:
	RegionBazaar(DummyConstructorParameter* param);

	virtual ~RegionBazaar();

	friend class RegionBazaarHelper;
};

class RegionBazaarImplementation;

class RegionBazaarAdapter : public SceneObjectAdapter {
public:
	RegionBazaarAdapter(RegionBazaarImplementation* impl);

	Packet* invokeMethod(sys::uint32 methid, DistributedMethod* method);

	void addItem(AuctionItem* item);

	bool removeItem(long long objectid);

	void setRegion(string& region);

	void setManager(BazaarPlanetManager* manager);

	void newBazaarRequest(long long bazaarID, Player* player, int planet);

	void getBazaarData(Player* player, long long objectid, int screen, int extent, int category, int count, int offset);

protected:
	string _param0_setRegion__string_;
};

class RegionBazaarHelper : public DistributedObjectClassHelper, public Singleton<RegionBazaarHelper> {
	static RegionBazaarHelper* staticInitializer;

public:
	RegionBazaarHelper();

	void finalizeHelper();

	DistributedObject* instantiateObject();

	DistributedObjectAdapter* createAdapter(DistributedObjectStub* obj);

	friend class SingletonWrapper<RegionBazaarHelper>;
};

#include "../../../scene/SceneObjectImplementation.h"

class RegionBazaarServant : public SceneObjectImplementation {
public:
	RegionBazaar* _this;

public:
	RegionBazaarServant();
	virtual ~RegionBazaarServant();

	void _setStub(DistributedObjectStub* stub);
	DistributedObjectStub* _getStub();

};

#endif /*REGIONBAZAAR_H_*/
