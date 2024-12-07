eng_novaldex_advanced = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/tangible/ship/components/engine/eng_novaldex_advanced.iff",
	craftingValues = {
		{"ship_component_engine_speed_maximum", 45, 80.6, 1},
		{"ship_component_engine_pitch_rate_maximum", 43.2, 64.7, 1},
		{"ship_component_engine_roll_rate_maximum", 43.2, 64.7, 1},
		{"ship_component_engine_yaw_rate_maximum", 45.5, 68.1, 1},
		{"ship_component_hitpoints", 897.5, 1193.2, 1},
		{"ship_component_armor", 448.7, 596.6, 1},
		{"ship_component_energy_required", 2409, 1041, 0},
		{"ship_component_mass", 56349, 24381, 0},
		{"reverseengineeringlevel", 9, 9, 0},
	},

	customizationStringName = {},
	customizationValues = {}
}


addLootItemTemplate("eng_novaldex_advanced", eng_novaldex_advanced)
