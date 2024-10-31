--Start--
object_tangible_wearables_armor_ithorian_guardian_ith_armor_s02_leggings = object_tangible_wearables_armor_ithorian_guardian_shared_ith_armor_s02_leggings:new {

	templateType = ARMOROBJECT,

	playerRaces = { "object/creature/player/ithorian_male.iff",
				"object/creature/player/ithorian_female.iff",
				"object/mobile/vendor/ithorian_female.iff",
				"object/mobile/vendor/ithorian_male.iff" },

	-- Damage types in WeaponObject
	vulnerability = ACID + STUN + LIGHTSABER,

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
	experimentalGroupTitles = {"null", "null", "null", "null", "exp_quality", "exp_durability", "exp_durability", "exp_durability", "exp_durability", "null", "null", "exp_resistance", "null"},
	experimentalSubGroupTitles = {"null", "null", "sockets", "hit_points", "armor_effectiveness", "armor_integrity", "armor_health_encumbrance", "armor_action_encumbrance", "armor_mind_encumbrance", "armor_rating", "armor_special_type", "armor_special_effectiveness", "armor_special_integrity"},
	experimentalMin = {0, 0, 0, 1000, 5, 15000, 39, 100, 16, 1, 1, 5, 15000},
	experimentalMax = {0, 0, 0, 1000, 30, 25000, 23, 60, 9, 1, 1, 40, 25000},
	experimentalPrecision = {0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0},
	experimentalCombineType = {0, 0, 4, 1, 1, 1, 1, 1, 1, 4, 4, 4, 1},
}

ObjectTemplates:addTemplate(object_tangible_wearables_armor_ithorian_guardian_ith_armor_s02_leggings, "object/tangible/wearables/armor/ithorian_guardian/ith_armor_s02_leggings.iff")
--End--
