eng_mandal_firestorm = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/tangible/ship/components/engine/eng_mandal_firestorm.iff",
	craftingValues = {
		{"ship_component_engine_speed_maximum", 42.3, 75.8, 1},
		{"ship_component_engine_pitch_rate_maximum", 42.9, 64.3, 1},
		{"ship_component_engine_roll_rate_maximum", 42.9, 64.3, 1},
		{"ship_component_engine_yaw_rate_maximum", 42.9, 64.3, 1},
		{"ship_component_hitpoints", 802.2, 1066.6, 1},
		{"ship_component_armor", 401.1, 533.3, 1},
		{"ship_component_energy_required", 2409, 1041, 0},
		{"ship_component_mass", 22540, 9752, 0},
		{"reverseengineeringlevel", 7, 7, 0},
	},

	customizationStringName = {},
	customizationValues = {}
}


addLootItemTemplate("eng_mandal_firestorm", eng_mandal_firestorm)
