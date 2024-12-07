eng_sfs_advanced = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/tangible/ship/components/engine/eng_sfs_advanced.iff",
	craftingValues = {
		{"ship_component_engine_speed_maximum", 49.7, 89.1, 1},
		{"ship_component_engine_pitch_rate_maximum", 40.2, 67.8, 1},
		{"ship_component_engine_roll_rate_maximum", 40.2, 67.8, 1},
		{"ship_component_engine_yaw_rate_maximum", 40.2, 67.8, 1},
		{"ship_component_hitpoints", 944.7, 1256, 1},
		{"ship_component_armor", 472.3, 628, 1},
		{"ship_component_energy_required", 2513, 1087, 0},
		{"ship_component_mass", 58799, 25441, 0},
		{"reverseengineeringlevel", 9, 9, 0},
	},

	customizationStringName = {},
	customizationValues = {}
}


addLootItemTemplate("eng_sfs_advanced", eng_sfs_advanced)
