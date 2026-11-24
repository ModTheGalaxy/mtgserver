#ifndef SLICINGPERMISSIONS_H_
#define SLICINGPERMISSIONS_H_

#include "server/zone/objects/creature/CreatureObject.h"
#include "server/zone/objects/player/PlayerObject.h"

namespace SlicingPermissions {
	inline int weaponPointLimit(CreatureObject* player) {
		PlayerObject* ghost = player->getPlayerObject();
		if (ghost == nullptr)
			return 0;

		if (ghost->hasAbility("slice_weaponsadvanced"))
			return 100;
		if (ghost->hasAbility("slice_weaponsbasic"))
			return 50;
		return 0;
	}

	inline bool canSliceArmor(CreatureObject* player) {
		PlayerObject* ghost = player->getPlayerObject();
		return ghost != nullptr && ghost->hasAbility("slice_armor");
	}
}

#endif
