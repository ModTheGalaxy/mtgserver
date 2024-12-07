eng_kse_a2x = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/tangible/ship/components/engine/eng_kse_a2x.iff",
	craftingValues = {
		{"ship_component_engine_speed_maximum", 30.1, 53.9, 1},
		{"ship_component_engine_pitch_rate_maximum", 36, 54, 1},
		{"ship_component_engine_roll_rate_maximum", 36, 54, 1},
		{"ship_component_engine_yaw_rate_maximum", 36, 54, 1},
		{"ship_component_hitpoints", 128.7, 171.3, 1},
		{"ship_component_armor", 64.3, 85.7, 1},
		{"ship_component_energy_required", 2094, 906, 0},
		{"ship_component_mass", 1257, 543, 0},
		{"reverseengineeringlevel", 1, 1, 0},
	},

	customizationStringName = {},
	customizationValues = {}
}


addLootItemTemplate("eng_kse_a2x", eng_kse_a2x)
