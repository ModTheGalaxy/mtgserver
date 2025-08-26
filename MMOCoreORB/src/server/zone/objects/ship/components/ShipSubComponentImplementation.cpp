#include "server/zone/objects/ship/components/ShipSubComponent.h"
#include "server/zone/objects/ship/components/ShipComponentAttributes.h"

void ShipSubComponentImplementation::updateCraftingValues(CraftingValues* values, bool firstUpdate) {
	ComponentImplementation::updateCraftingValues(values, firstUpdate);

	Vector<String> attributesCopy = keyList;
	Vector<String> attributesList;

	for (int i = 0; i < ShipComponentAttributes::ATTRIBUTES.size(); ++i) {
		const String& attribute = ShipComponentAttributes::ATTRIBUTES.get(i);
		int index = attributesCopy.find(attribute);

		if (index == -1) {
			continue;
		}

		attributesList.add(attribute);
		attributesCopy.remove(index);
	}

	for (int i = 0; i < attributesCopy.size(); ++i) {
		const String& attribute = attributesCopy.get(i);
		attributesList.add(attribute);
	}

	keyList = std::move(attributesList);
}

void ShipSubComponentImplementation::fillAttributeList(AttributeListMessage* alm, CreatureObject* object) {
	alm->insertAttribute("volume", 1);
	alm->insertAttribute("crafter", craftersName);
	alm->insertAttribute("serial_number", objectSerial);

	for (int i = 0; i < keyList.size(); ++i) {
		String attribute = keyList.get(i);
		bool hidden = hiddenMap.get(attribute);

		if (attribute.isEmpty() || hidden) {
			continue;
		}

		float value = attributeMap.get(attribute);
		int precision = precisionMap.get(attribute);

		switch (attribute.hashCode()) {
			case String::hashCode("armorhpmax"): {
				attribute = "ship_component_armor";
				break;
			}
			case String::hashCode("hitpointsmax"): {
				attribute = "ship_component_hitpoints";
				break;
			}
			case String::hashCode("energy_maintenance"): {
				attribute = "ship_component_energy_required";
				break;
			}
			case String::hashCode("mass"): {
				attribute = "ship_component_mass";
				break;
			}
			case String::hashCode("effective_shields"):
			case String::hashCode("ship_component_weapon_effectiveness_shields"):{
				attribute = "ship_component_weapon_effectiveness_shields";
				value *= 0.001f;
				break;
			}
			case String::hashCode("effective_armor"):
			case String::hashCode("ship_component_weapon_effectiveness_armor"):{
				attribute = "ship_component_weapon_effectiveness_armor";
				value *= 0.001f;
				break;
			}
			case String::hashCode("energy_per_shot"): {
				attribute = "ship_component_weapon_energy_per_shot";
				break;
			}
			case String::hashCode("refire_rate"):
			case String::hashCode("ship_component_weapon_refire_rate"): {
				attribute = "ship_component_weapon_refire_rate";
				value *= 0.001f;
				break;
			}
		}

		if (fabs(value) < 1e-06f || precision < 0) {
			continue;
		}

		String displayName = "@obj_attr_n:ship_component." + attribute;
		String displayValue = String::valueOf(value, (precision % 10));

		if (precision >= 10) {
			displayValue = displayValue + "%";
		}

		alm->insertAttribute(displayName, displayValue);
	}
}
