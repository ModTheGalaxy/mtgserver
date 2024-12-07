shd_cygnus_mk4 = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/tangible/ship/components/shield_generator/shd_cygnus_mk4.iff",
	craftingValues = {
		{"ship_component_shield_recharge_rate", 2.5, 16.5, 1},
		{"ship_component_shield_hitpoints_front", 244.7, 2447.6, 1},
		{"ship_component_shield_hitpoints_back", 244.7, 2447.6, 1},
		{"ship_component_hitpoints", 855.1, 1013.8, 1},
		{"ship_component_armor", 427.5, 506.9, 1},
		{"ship_component_energy_required", 5419, 541, 0},
		{"ship_component_mass", 36271, 10061, 0},
		{"reverseengineeringlevel", 7, 7, 0},
	},

	customizationStringName = {},
	customizationValues = {}
}


addLootItemTemplate("shd_cygnus_mk4", shd_cygnus_mk4)
