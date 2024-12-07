#ifndef LUASHIPCOMPONENT_H_
#define LUASHIPCOMPONENT_H_

#include "engine/engine.h"
#include "server/zone/objects/tangible/LuaTangibleObject.h"

namespace server {
namespace zone {
namespace objects {
namespace ship {
namespace components {
class ShipComponent;

class LuaShipComponent : public LuaTangibleObject {
public:
	// Constants
	static const char className[];
	static Luna<LuaShipComponent>::RegType Register[];

	// Initialize the pointer
	LuaShipComponent(lua_State* L);
	~LuaShipComponent();

	int _setObject(lua_State* L);
	int getReverseEngineeringLevel(lua_State* L);

private:
	ShipComponent* realObject;
};

} // namespace components
} // namespace ship
} // namespace objects
} // namespace zone
} // namespace server

using namespace server::zone::objects::ship::components;

#endif /*LUASHIPCOMPONENT_H_ */