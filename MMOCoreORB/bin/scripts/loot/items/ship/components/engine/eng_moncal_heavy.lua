eng_moncal_heavy = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/tangible/ship/components/engine/eng_moncal_heavy.iff",
	craftingValues = {
		{"ship_component_engine_speed_maximum", 37.7, 67.6, 1},
		{"ship_component_engine_pitch_rate_maximum", 40.5, 60.6, 1},
		{"ship_component_engine_roll_rate_maximum", 40.5, 60.6, 1},
		{"ship_component_engine_yaw_rate_maximum", 40.5, 60.6, 1},
		{"ship_component_hitpoints", 436, 579.7, 1},
		{"ship_component_armor", 218, 289.9, 1},
		{"ship_component_energy_required", 1885, 815, 0},
		{"ship_component_mass", 9423, 4077, 0},
		{"reverseengineeringlevel", 5, 5, 0},
	},

	customizationStringName = {},
	customizationValues = {}
}


addLootItemTemplate("eng_moncal_heavy", eng_moncal_heavy)
