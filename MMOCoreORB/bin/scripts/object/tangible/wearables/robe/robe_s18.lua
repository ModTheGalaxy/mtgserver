--Start--
object_tangible_wearables_robe_robe_s18 = object_tangible_wearables_robe_shared_robe_s18:new {
	objectMenuComponent = "ArmorObjectMenuComponent",
	playerRaces = { "object/creature/player/wookiee_male.iff",
				"object/creature/player/wookiee_female.iff",
				"object/mobile/vendor/wookiee_female.iff",
				"object/mobile/vendor/wookiee_male.iff" },

	numberExperimentalProperties = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
	experimentalProperties = {"XX", "XX", "XX", "XX", "XX", "XX", "XX", "XX", "XX", "XX", "XX", "XX", "XX", "XX", "XX", "XX"},
	experimentalWeights = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
	experimentalGroupTitles = {"null", "null", "null", "null", "null", "null", "null", "null", "null", "null", "null", "null", "null", "null", "null", "null"},
	experimentalSubGroupTitles = {"null", "null", "sockets", "hitpoints", "mod_idx_one", "mod_val_one", "mod_idx_two", "mod_val_two", "mod_idx_three", "mod_val_three", "mod_idx_four", "mod_val_four", "mod_idx_five", "mod_val_five", "mod_idx_six", "mod_val_six"},
	experimentalMin = {0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
	experimentalMax = {0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
	experimentalPrecision = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
	experimentalCombineType = {0, 0, 4, 4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
}

ObjectTemplates:addTemplate(object_tangible_wearables_robe_robe_s18, "object/tangible/wearables/robe/robe_s18.iff")
--End--
