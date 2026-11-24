/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef STANDCOMMAND_H_
#define STANDCOMMAND_H_

class StandCommand : public QueueCommand {
public:
	const static int MINDELTA = 100;

	StandCommand(const String& name, ZoneProcessServer* server)
		: QueueCommand(name, server) {

	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {
		if (!checkStateMask(creature)) {
			return INVALIDSTATE;
		}

		if (creature->isKnockedDown())
			return INVALIDLOCOMOTION;

		if (!checkInvalidLocomotions(creature)) {
			if (creature->isFeigningDeath() && !creature->hasIncapTimer()) {
				creature->removeFeignedDeath();
				creature->setPosture(CreaturePosture::KNOCKEDDOWN, false, true);
				//Allow us to pass the state/locomotion checks below, but still enter dizzy/KD checks
			} else {
				return INVALIDLOCOMOTION;
			}
		}

		if (creature->isAiAgent()) {
			return setAiAgentPosture(creature);
		}

		if (creature->isPlayerCreature()) {
			return setPlayerPosture(creature);
		}

		creature->setPosture(CreaturePosture::UPRIGHT);
		return SUCCESS;
	}

	int setAiAgentPosture(CreatureObject* creature) const {
		creature->setPosture(CreaturePosture::UPRIGHT);
		return SUCCESS;
	}

	int setPlayerPosture(CreatureObject* creature) const {
		const String& commandName = getQueueCommandName();

		if (creature->getQueueCommandDeltaTime(commandName) < StandCommand::MINDELTA) {
			return GENERALERROR;
		}

		creature->setQueueCommandDeltaTime(commandName, "setPosture");
		creature->setPosture(CreaturePosture::UPRIGHT);
		return SUCCESS;
	}
};

#endif //STANDCOMMAND_H_

