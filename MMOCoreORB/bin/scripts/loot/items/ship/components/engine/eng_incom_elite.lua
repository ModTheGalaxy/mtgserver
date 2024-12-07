eng_incom_elite = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/tangible/ship/components/engine/eng_incom_elite.iff",
	craftingValues = {
		{"ship_component_engine_speed_maximum", 59.2, 106, 1},
		{"ship_component_engine_pitch_rate_maximum", 56.9, 85.1, 1},
		{"ship_component_engine_roll_rate_maximum", 56.9, 85.1, 1},
		{"ship_component_engine_yaw_rate_maximum", 56.9, 85.1, 1},
		{"ship_component_hitpoints", 1299, 1727, 1},
		{"ship_component_armor", 649.5, 863.5, 1},
		{"ship_component_energy_required", 2513, 1087, 0},
		{"ship_component_mass", 76765, 33215, 0},
		{"reverseengineeringlevel", 10, 10, 0},
	},

	customizationStringName = {},
	customizationValues = {}
}


addLootItemTemplate("eng_incom_elite", eng_incom_elite)
