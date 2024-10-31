--Start--
object_tangible_wearables_ithorian_apron_chef_jacket_s01_ith = object_tangible_wearables_ithorian_shared_apron_chef_jacket_s01_ith:new {
	objectMenuComponent = "ArmorObjectMenuComponent",
	playerRaces = { "object/creature/player/ithorian_male.iff",
				"object/creature/player/ithorian_female.iff",
				"object/mobile/vendor/ithorian_female.iff",
				"object/mobile/vendor/ithorian_male.iff" },

	numberExperimentalProperties = {1, 1, 1, 1},
	experimentalProperties = {"XX", "XX", "XX", "XX"},
	experimentalWeights = {1, 1, 1, 1},
	experimentalGroupTitles = {"null", "null", "null", "null"},
	experimentalSubGroupTitles = {"null", "null", "sockets", "hitpoints"},
	experimentalMin = {0, 0, 0, 1000},
	experimentalMax = {0, 0, 0, 1000},
	experimentalPrecision = {0, 0, 0, 0},
	experimentalCombineType = {0, 0, 4, 4},
}

ObjectTemplates:addTemplate(object_tangible_wearables_ithorian_apron_chef_jacket_s01_ith, "object/tangible/wearables/ithorian/apron_chef_jacket_s01_ith.iff")
--End--
