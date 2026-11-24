/*
 * PerformanceBuffImplementation.cpp
 *
 *  Created on: 04/03/2011
 *      Author: Itac
 */

#include "server/zone/objects/creature/buffs/PerformanceBuff.h"
#include "server/zone/objects/creature/CreatureObject.h"
#include "templates/params/creature/CreatureAttribute.h"
#include "server/zone/objects/creature/buffs/PerformanceBuffType.h"
#include "server/zone/objects/creature/buffs/PerformanceEnhancement.h"

void PerformanceBuffImplementation::activate(bool applyModifiers) {

	if(type == PerformanceBuffType::DANCE_MIND) {
		int mindStrength = PerformanceEnhancement::mindBuffPower(strength);
		setAttributeModifier(CreatureAttribute::MIND, mindStrength);
		creature.get()->sendSystemMessage("@healing:performance_enhance_dance_mind_d");

	}
	else if(type == PerformanceBuffType::MUSIC_FOCUS) {
		int focusStrength = PerformanceEnhancement::secondaryBuffPower(strength);
		setAttributeModifier(CreatureAttribute::FOCUS, focusStrength);
		creature.get()->sendSystemMessage("@healing:performance_enhance_music_focus_d");

	}
	else if(type == PerformanceBuffType::MUSIC_WILLPOWER) {
		int willStrength = PerformanceEnhancement::secondaryBuffPower(strength);
		setAttributeModifier(CreatureAttribute::WILLPOWER, willStrength);
		creature.get()->sendSystemMessage("@healing:performance_enhance_music_willpower_d");
	}

	BuffImplementation::activate(true);

}

void PerformanceBuffImplementation::deactivate(bool removeModifiers) {
	BuffImplementation::deactivate(true);
}
