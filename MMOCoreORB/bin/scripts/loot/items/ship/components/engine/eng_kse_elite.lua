eng_kse_elite = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/tangible/ship/components/engine/eng_kse_elite.iff",
	craftingValues = {
		{"ship_component_engine_speed_maximum", 62.2, 111.3, 1},
		{"ship_component_engine_pitch_rate_maximum", 59.8, 89.4, 1},
		{"ship_component_engine_roll_rate_maximum", 59.8, 89.4, 1},
		{"ship_component_engine_yaw_rate_maximum", 59.8, 89.4, 1},
		{"ship_component_hitpoints", 1240, 1648.5, 1},
		{"ship_component_armor", 620, 824.3, 1},
		{"ship_component_energy_required", 2618, 1132, 0},
		{"ship_component_mass", 73813, 31937, 0},
		{"reverseengineeringlevel", 10, 10, 0},
	},

	customizationStringName = {},
	customizationValues = {}
}


addLootItemTemplate("eng_kse_elite", eng_kse_elite)
