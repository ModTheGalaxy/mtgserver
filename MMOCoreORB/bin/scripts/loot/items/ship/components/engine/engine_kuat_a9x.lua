engine_kuat_a9x = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/tangible/ship/components/engine/engine_kuat_a9x.iff",
	craftingValues = {
		{"ship_component_engine_speed_maximum", 40.2, 72, 1},
		{"ship_component_engine_pitch_rate_maximum", 40.8, 61.1, 1},
		{"ship_component_engine_roll_rate_maximum", 40.8, 61.1, 1},
		{"ship_component_engine_yaw_rate_maximum", 42.9, 64.3, 1},
		{"ship_component_hitpoints", 762.1, 1013.3, 1},
		{"ship_component_armor", 381, 506.7, 1},
		{"ship_component_energy_required", 2304, 996, 0},
		{"ship_component_mass", 21560, 9328, 0},
		{"reverseengineeringlevel", 7, 7, 0},
	},

	customizationStringName = {},
	customizationValues = {}
}


addLootItemTemplate("engine_kuat_a9x", engine_kuat_a9x)
