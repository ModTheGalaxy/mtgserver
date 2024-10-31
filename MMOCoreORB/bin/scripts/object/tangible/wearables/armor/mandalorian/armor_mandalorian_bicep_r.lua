--Start--
object_tangible_wearables_armor_mandalorian_armor_mandalorian_bicep_r = object_tangible_wearables_armor_mandalorian_shared_armor_mandalorian_bicep_r:new {
	templateType = ARMOROBJECT,

	certificationsRequired = { "combat_bountyhunter_master",
					"combat_commando_master",
					"outdoors_squadleader_master",
					"outdoors_ranger_master" },

	playerRaces = { "object/creature/player/bothan_male.iff",
				"object/creature/player/bothan_female.iff",
				"object/creature/player/human_male.iff",
				"object/creature/player/human_female.iff",
				"object/creature/player/moncal_male.iff",
				"object/creature/player/moncal_female.iff",
				"object/creature/player/rodian_male.iff",
				"object/creature/player/rodian_female.iff",
				"object/creature/player/sullustan_male.iff",
				"object/creature/player/sullustan_female.iff",
				"object/creature/player/trandoshan_male.iff",
				"object/creature/player/trandoshan_female.iff",
				"object/creature/player/twilek_male.iff",
				"object/creature/player/twilek_female.iff",
				"object/creature/player/zabrak_male.iff",
				"object/creature/player/zabrak_female.iff",
				"object/mobile/vendor/aqualish_female.iff",
				"object/mobile/vendor/aqualish_male.iff",
				"object/mobile/vendor/bith_female.iff",
				"object/mobile/vendor/bith_male.iff",
				"object/mobile/vendor/bothan_female.iff",
				"object/mobile/vendor/bothan_male.iff",
				"object/mobile/vendor/devaronian_male.iff",
				"object/mobile/vendor/gran_male.iff",
				"object/mobile/vendor/human_female.iff",
				"object/mobile/vendor/human_male.iff",
				"object/mobile/vendor/ishi_tib_male.iff",
				"object/mobile/vendor/moncal_female.iff",
				"object/mobile/vendor/moncal_male.iff",
				"object/mobile/vendor/nikto_male.iff",
				"object/mobile/vendor/quarren_male.iff",
				"object/mobile/vendor/rodian_female.iff",
				"object/mobile/vendor/rodian_male.iff",
				"object/mobile/vendor/sullustan_female.iff",
				"object/mobile/vendor/sullustan_male.iff",
				"object/mobile/vendor/trandoshan_female.iff",
				"object/mobile/vendor/trandoshan_male.iff",
				"object/mobile/vendor/twilek_female.iff",
				"object/mobile/vendor/twilek_male.iff",
				"object/mobile/vendor/weequay_male.iff",
				"object/mobile/vendor/zabrak_female.iff",
				"object/mobile/vendor/zabrak_male.iff" },
	
	-- Damage types in WeaponObject
	vulnerability = COLD + ELECTRICITY + STUN + LIGHTSABER,

	-- These are default Blue Frog stats, These are also used as temporary DWB crafting stats. Needs to be adjusted to random color, and Blast should be a Special Resist. Encumberance on boots and all arm/hand armor are estimated. Helm/Chest/Leggings are correct. 
	healthEncumbrance = 50,
	actionEncumbrance = 48,
	mindEncumbrance = 53,

	-- LIGHT, MEDIUM, HEAVY
	rating = LIGHT,
	maxCondition = 40000,

	kinetic = 58,
	energy = 58,
	electricity = 0,
	stun = 0,
	blast = 65,
	heat = 58,
	cold = 0,
	acid = 58,
	lightSaber = 0
}

ObjectTemplates:addTemplate(object_tangible_wearables_armor_mandalorian_armor_mandalorian_bicep_r, "object/tangible/wearables/armor/mandalorian/armor_mandalorian_bicep_r.iff")
--End--
