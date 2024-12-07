eng_moncal_standard = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/tangible/ship/components/engine/eng_moncal_standard.iff",
	craftingValues = {
		{"ship_component_engine_speed_maximum", 35.4, 63.4, 1},
		{"ship_component_engine_pitch_rate_maximum", 33.7, 56.9, 1},
		{"ship_component_engine_roll_rate_maximum", 33.7, 56.9, 1},
		{"ship_component_engine_yaw_rate_maximum", 33.7, 56.9, 1},
		{"ship_component_hitpoints", 296.2, 393.8, 1},
		{"ship_component_armor", 148.1, 196.9, 1},
		{"ship_component_energy_required", 2199, 951, 0},
		{"ship_component_mass", 3299, 1426, 0},
		{"reverseengineeringlevel", 3, 3, 0},
	},

	customizationStringName = {},
	customizationValues = {}
}


addLootItemTemplate("eng_moncal_standard", eng_moncal_standard)
