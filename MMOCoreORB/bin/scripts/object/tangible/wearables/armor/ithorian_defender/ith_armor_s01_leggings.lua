--Start--
object_tangible_wearables_armor_ithorian_defender_ith_armor_s01_leggings = object_tangible_wearables_armor_ithorian_defender_shared_ith_armor_s01_leggings:new {

	templateType = ARMOROBJECT,

	playerRaces = { "object/creature/player/ithorian_male.iff",
				"object/creature/player/ithorian_female.iff",
				"object/mobile/vendor/ithorian_female.iff",
				"object/mobile/vendor/ithorian_male.iff" },

	-- Damage types in WeaponObject
	vulnerability = HEAT + COLD + STUN + LIGHTSABER,

	-- These are default Blue Frog stats
	healthEncumbrance = 1,
	actionEncumbrance = 1,
	mindEncumbrance = 1,

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
	lightSaber = 0,

	numberExperimentalProperties = {1, 1, 1, 2, 2, 2, 2, 2, 2, 1, 1, 2, 1},
	experimentalProperties = {"XX", "XX", "XX", "OQ", "SR", "OQ", "SR", "OQ", "UT", "MA", "OQ", "MA", "OQ", "MA", "OQ", "XX", "XX", "OQ", "SR", "XX"},
	experimentalWeights = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
	experimentalGroupTitles = {"null", "null", "null", "exp_durability", "exp_quality", "exp_durability", "exp_durability", "exp_durability", "exp_durability", "null", "null", "exp_resistance", "null"},
	experimentalSubGroupTitles = {"null", "null", "sockets", "hit_points", "armor_effectiveness", "armor_integrity", "armor_health_encumbrance", "armor_action_encumbrance", "armor_mind_encumbrance", "armor_rating", "armor_special_type", "armor_special_effectiveness", "armor_special_integrity"},
	experimentalMin = {0, 0, 0, 1000, 1, 18750, 52, 175, 23, 1, 4, 1, 18750},
	experimentalMax = {0, 0, 0, 1000, 30, 31250, 31, 105, 14, 1, 4, 40, 31250},
	experimentalPrecision = {0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0},
	experimentalCombineType = {0, 0, 4, 1, 1, 1, 1, 1, 1, 4, 4, 4, 1},
}

ObjectTemplates:addTemplate(object_tangible_wearables_armor_ithorian_defender_ith_armor_s01_leggings, "object/tangible/wearables/armor/ithorian_defender/ith_armor_s01_leggings.iff")
--End--
