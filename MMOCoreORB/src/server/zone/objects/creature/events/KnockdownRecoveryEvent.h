/*
 * KnockdownRecoveryEvent.h
 */

#ifndef KNOCKDOWNRECOVERYEVENT_H_
#define KNOCKDOWNRECOVERYEVENT_H_

#include "server/zone/objects/creature/CreatureObject.h"

namespace server {
namespace zone {
namespace objects {
namespace creature {
namespace events {

class KnockdownRecoveryEvent : public Task {
	ManagedReference<CreatureObject*> creature;

public:
	KnockdownRecoveryEvent(CreatureObject* creature) : Task(5000), creature(creature) {
	}

	void run() {
		Locker locker(creature);

		if (creature->getZone() != nullptr && !creature->isDead() && !creature->isIncapacitated() && creature->isKnockedDown())
			creature->setPosture(CreaturePosture::UPRIGHT, true, true);

		creature->clearKnockdownRecoveryEvent();
	}
};

}
}
}
}
}

#endif /* KNOCKDOWNRECOVERYEVENT_H_ */
