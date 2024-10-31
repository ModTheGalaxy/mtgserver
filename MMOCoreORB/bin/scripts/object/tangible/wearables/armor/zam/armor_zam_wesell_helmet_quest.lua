--Start--
object_tangible_wearables_armor_zam_armor_zam_wesell_helmet_quest = object_tangible_wearables_armor_zam_shared_armor_zam_wesell_helmet_quest:new {
	templateType = ARMOROBJECT,

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
				"object/mobile/vendor/bothan_female.iff",
				"object/mobile/vendor/bothan_male.iff",
				"object/mobile/vendor/human_female.iff",
				"object/mobile/vendor/human_male.iff",
				"object/mobile/vendor/moncal_female.iff",
				"object/mobile/vendor/moncal_male.iff",
				"object/mobile/vendor/rodian_female.iff",
				"object/mobile/vendor/rodian_male.iff",
				"object/mobile/vendor/sullustan_female.iff",
				"object/mobile/vendor/sullustan_male.iff",
				"object/mobile/vendor/trandoshan_female.iff",
				"object/mobile/vendor/trandoshan_male.iff",
				"object/mobile/vendor/twilek_female.iff",
				"object/mobile/vendor/twilek_male.iff",
				"object/mobile/vendor/zabrak_female.iff",
				"object/mobile/vendor/zabrak_male.iff" },
	
	-- Damage types in WeaponObject
	vulnerability = ACID + ENERGY + STUN + LIGHTSABER,

	-- These are default Blue Frog stats
	healthEncumbrance = 6,
	actionEncumbrance = 3,
	mindEncumbrance = 54,

	-- LIGHT, MEDIUM, HEAVY
	rating = LIGHT,

	maxCondition = 15000,

	kinetic = 10,
	energy = 0,
	electricity = 10,
	stun = 0,
	blast = 5,
	heat = 20,
	cold = 10,
	acid = 0,
	lightSaber = 0
}

ObjectTemplates:addTemplate(object_tangible_wearables_armor_zam_armor_zam_wesell_helmet_quest, "object/tangible/wearables/armor/zam/armor_zam_wesell_helmet_quest.iff")
--End--
