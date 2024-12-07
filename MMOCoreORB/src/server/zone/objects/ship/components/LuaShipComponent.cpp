#include "LuaShipComponent.h"
#include "server/zone/objects/ship/components/ShipComponent.h"


const char LuaShipComponent::className[] = "LuaShipComponent";

Luna<LuaShipComponent>::RegType LuaShipComponent::Register[] = {
	{ "_setObject", &LuaShipComponent::_setObject },
	{ "_getObject", &LuaSceneObject::_getObject },
	{ "getReverseEngineeringLevel", &LuaShipComponent::getReverseEngineeringLevel },
	{ 0, 0}
};

LuaShipComponent::LuaShipComponent(lua_State *L) : LuaTangibleObject(L) {
#ifdef DYNAMIC_CAST_LUAOBJECTS
	realObject = dynamic_cast<ShipComponent*>(_getRealSceneObject());
	assert(!_getRealSceneObject() || realObject != nullptr);
#else
	realObject = static_cast<ShipComponent*>(lua_touserdata(L, 1));
#endif
}

LuaShipComponent::~LuaShipComponent(){
}

int LuaShipComponent::_setObject(lua_State* L) {
	LuaTangibleObject::_setObject(L);

#ifdef DYNAMIC_CAST_LUAOBJECTS
	auto obj = dynamic_cast<ShipComponent*>(_getRealSceneObject());

	if (obj != realObject)
		realObject = obj;

	assert(!_getRealSceneObject() || realObject != nullptr);
#else
	auto obj = static_cast<ShipComponent*>(lua_touserdata(L, -1));

	if (realObject != obj)
		realObject = obj;
#endif

	return 0;
}

int LuaShipComponent::getReverseEngineeringLevel(lua_State* L) {
	int rELevel = realObject->getReverseEngineeringLevel();

	lua_pushinteger(L, rELevel);

	return 1;
}
