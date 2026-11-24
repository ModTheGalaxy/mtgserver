/*
 * PlayerAutoAttackEvent.h
 */

#ifndef PLAYERAUTOATTACKEVENT_H_
#define PLAYERAUTOATTACKEVENT_H_

#include "server/zone/objects/player/PlayerObject.h"

namespace server {
namespace zone {
namespace objects {
namespace player {
namespace events {

class PlayerAutoAttackEvent : public Task {
	ManagedWeakReference<PlayerObject*> weakPlayer;
	uint64 generation;

public:
	PlayerAutoAttackEvent(PlayerObject* player, uint64 generation) : Task(0), generation(generation) {
		weakPlayer = player;
	}

	void run() {
		ManagedReference<PlayerObject*> player = weakPlayer.get();
		if (player == nullptr)
			return;

		ManagedReference<SceneObject*> parent = player->getParent().get();
		if (parent == nullptr)
			return;

		Locker locker(parent);
		player->doAutoAttackEvent(generation);
	}
};

}
}
}
}
}

#endif /* PLAYERAUTOATTACKEVENT_H_ */
