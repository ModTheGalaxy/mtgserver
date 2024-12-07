engine_damorian_rx7 = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/tangible/ship/components/engine/engine_damorian_rx7.iff",
	craftingValues = {
		{"ship_component_engine_speed_maximum", 42.1, 75.5, 1},
		{"ship_component_engine_pitch_rate_maximum", 47.8, 71.5, 1},
		{"ship_component_engine_roll_rate_maximum", 47.8, 71.5, 1},
		{"ship_component_engine_yaw_rate_maximum", 47.8, 71.5, 1},
		{"ship_component_hitpoints", 370.2, 492.3, 1},
		{"ship_component_armor", 185.1, 246.2, 1},
		{"ship_component_energy_required", 2199, 951, 0},
		{"ship_component_mass", 6047, 2616, 0},
		{"reverseengineeringlevel", 4, 4, 0},
	},

	customizationStringName = {},
	customizationValues = {}
}


addLootItemTemplate("engine_damorian_rx7", engine_damorian_rx7)
