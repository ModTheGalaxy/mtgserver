engine_kongar_defender = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/tangible/ship/components/engine/engine_kongar_defender.iff",
	craftingValues = {
		{"ship_component_engine_speed_maximum", 42.1, 75.5, 1},
		{"ship_component_engine_pitch_rate_maximum", 47.8, 71.5, 1},
		{"ship_component_engine_roll_rate_maximum", 47.8, 71.5, 1},
		{"ship_component_engine_yaw_rate_maximum", 47.8, 71.5, 1},
		{"ship_component_hitpoints", 351.7, 467.7, 1},
		{"ship_component_armor", 175.8, 233.9, 1},
		{"ship_component_energy_required", 2094, 906, 0},
		{"ship_component_mass", 5772, 2497, 0},
		{"reverseengineeringlevel", 4, 4, 0},
	},

	customizationStringName = {},
	customizationValues = {}
}


addLootItemTemplate("engine_kongar_defender", engine_kongar_defender)
