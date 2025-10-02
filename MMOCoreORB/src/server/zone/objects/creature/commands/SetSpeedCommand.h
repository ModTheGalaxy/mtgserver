/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef SETSPEEDCOMMAND_H_
#define SETSPEEDCOMMAND_H_

class SetSpeedCommand : public QueueCommand {
public:
	SetSpeedCommand(const String& name, ZoneProcessServer* server) : QueueCommand(name, server) {
	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {
		if (!checkStateMask(creature)) {
			return INVALIDSTATE;
		}

		if (!checkInvalidLocomotions(creature)) {
			return INVALIDLOCOMOTION;
		}

		if (!creature->isPlayerCreature()) {
			return GENERALERROR;
		}

		float speed = 0.f;
		int duration = 30;

		try {
			UnicodeTokenizer tokenizer(arguments);

			if (!tokenizer.hasMoreTokens()) {
				return GENERALERROR;
			}

			speed = tokenizer.getFloatToken();

			if (creature->isPilotingShip()) {
				auto rootParent = creature->getRootParent();

				if (rootParent == nullptr || !rootParent->isPlayerShip()) {
					creature->sendSystemMessage("You must be piloting a ship to use \"/setSpeed ship\".");
					creature->info(true) << "1";
					return GENERALERROR;
				}

				auto ship = rootParent->asShipObject();

				if (ship == nullptr || ship->getOwnerID() != creature->getObjectID()) {
					creature->sendSystemMessage("You can only use \"/setSpeed ship\" on your own ship.");
					return GENERALERROR;
				}

				speed /= 10.f;

				if (speed < 1.f) {
					speed = ship->calculateActualMaxSpeed();
				}

				Locker clock(ship, creature);

				auto deltaVector = ship->getDeltaVector();

				if (deltaVector == nullptr) {
					return GENERALERROR;
				}

				ship->setStaffShipSpeed(speed);
				ship->setActualMaxSpeed(speed, true, nullptr, deltaVector);

				deltaVector->sendMessages(ship);

				StringBuffer msg("You have set your ships speed to: ");
				msg << (speed * 10.f);

				creature->sendSystemMessage(msg.toString());

				return SUCCESS;
			}

			if (speed < 0) {
				throw Exception();
			}

			if (tokenizer.hasMoreTokens()) {
				duration = tokenizer.getIntToken();
			}
		} catch (Exception& e) {
			creature->sendSystemMessage("SYNTAX: /setSpeed <speed> [<duration>]");
			return INVALIDPARAMETERS;
		}

		StringIdChatParameter startMessage("admin", "Speed set to " + String::valueOf(speed) + " for " + String::valueOf(duration) + " minutes.");
		StringIdChatParameter endMessage("admin", "Speed has been reset to default.");

		duration *= 60; // Convert duration to seconds.

		uint32 buffCRC = STRING_HASHCODE("setSpeed");

		ManagedReference<Buff*> buff = new Buff(creature, buffCRC, duration, BuffType::OTHER);

		Locker locker(buff);

		buff->setSpeedMultiplierMod(speed);
		buff->setAccelerationMultiplierMod(speed);
		buff->setStartMessage(startMessage);
		buff->setEndMessage(endMessage);

		creature->addBuff(buff);

		return SUCCESS;
	}
};

#endif // SETSPEEDCOMMAND_H_
