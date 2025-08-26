/*
 * ColorWithKitSuiCallback.h
 *
 *  Created on: 1/20/215
 *      Author: Nick Rafalski
 *		Credits: TA & Valk
 */

#ifndef COLORWITHKITSUICALLBACK_H
#define COLORWITHKITSUICALLBACK_H

#include "server/zone/objects/player/sui/SuiCallback.h"
#include "server/zone/objects/creature/ai/DroidObject.h"
#include "server/zone/objects/creature/VehicleObject.h"

class ColorWithKitSuiCallback : public SuiCallback {
	TangibleObject* customizationKit;

public:
	ColorWithKitSuiCallback(ZoneServer* serv, TangibleObject* kitTano) : SuiCallback(serv), customizationKit(kitTano) {
	}

	void run(CreatureObject* creature, SuiBox* sui, uint32 eventIndex, Vector<UnicodeString>* args) {
		bool cancelPressed = (eventIndex == 1);

		if (cancelPressed) {
			return;
		}

		if (creature == nullptr || sui == nullptr || customizationKit == nullptr) {
			return;
		}

		if (!creature->isPlayerCreature()) {
			return;
		}

		SuiColorBox* colorBox = cast<SuiColorBox*>(sui);

		if (colorBox == nullptr) {
			return;
		}

		ManagedReference<TangibleObject*> target = colorBox->getUsingObject().get().castTo<TangibleObject*>();

		if (target == nullptr) {
			return;
		}

		Locker kitLock(customizationKit, creature);

		customizationKit->decreaseUseCount();

		int index = Integer::valueOf(args->get(0).toString());
		String palette = colorBox->getColorPalette();

		Locker targetLocker(target, creature);

		target->setCustomizationVariable(palette, index, true);
		target->refreshPaint();
	}
};

#endif /* COLORWITHKITSUICALLBACK_H */
