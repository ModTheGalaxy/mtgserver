--Start--
object_tangible_wearables_armor_nightsister_armor_nightsister_bicep_r_s01 = object_tangible_wearables_armor_nightsister_shared_armor_nightsister_bicep_r_s01:new {
	templateType = ARMOROBJECT,

	playerRaces = { "object/creature/player/bothan_female.iff",
				"object/creature/player/human_female.iff",
				"object/creature/player/moncal_female.iff",
				"object/creature/player/rodian_female.iff",
				"object/creature/player/sullustan_female.iff",
				"object/creature/player/trandoshan_female.iff",
				"object/creature/player/twilek_female.iff",
				"object/creature/player/zabrak_female.iff",
				"object/mobile/vendor/aqualish_female.iff",
				"object/mobile/vendor/bith_female.iff",
				"object/mobile/vendor/bothan_female.iff",
				"object/mobile/vendor/human_female.iff",
				"object/mobile/vendor/moncal_female.iff",
				"object/mobile/vendor/rodian_female.iff",
				"object/mobile/vendor/sullustan_female.iff",
				"object/mobile/vendor/trandoshan_female.iff",
				"object/mobile/vendor/twilek_female.iff",
				"object/mobile/vendor/zabrak_female.iff" },

	customName = "Nightsister Melee Armguard",

	-- Damage types in WeaponObject
	vulnerability = ELECTRICITY + ACID + STUN + LIGHTSABER,

	-- These are default Blue Frog stats
	healthEncumbrance = 25,
	actionEncumbrance = 50,
	mindEncumbrance = 25,

	-- LIGHT, MEDIUM, HEAVY
	rating = LIGHT,

	kinetic = 15,
	energy = 15,
	electricity = 15,
	stun = 15,
	blast = 15,
	heat = 15,
	cold = 15,
	acid = 15,
	lightSaber = 0
}

ObjectTemplates:addTemplate(object_tangible_wearables_armor_nightsister_armor_nightsister_bicep_r_s01, "object/tangible/wearables/armor/nightsister/armor_nightsister_bicep_r_s01.iff")
--End--
