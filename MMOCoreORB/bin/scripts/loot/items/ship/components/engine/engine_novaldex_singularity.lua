engine_novaldex_singularity = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/tangible/ship/components/engine/engine_novaldex_singularity.iff",
	craftingValues = {
		{"ship_component_engine_speed_maximum", 37.7, 67.6, 1},
		{"ship_component_engine_pitch_rate_maximum", 44, 62.1, 1},
		{"ship_component_engine_roll_rate_maximum", 44, 62.1, 1},
		{"ship_component_engine_yaw_rate_maximum", 44, 62.1, 1},
		{"ship_component_hitpoints", 545, 724.6, 1},
		{"ship_component_armor", 272.5, 362.3, 1},
		{"ship_component_energy_required", 2304, 996, 0},
		{"ship_component_mass", 8638, 3737, 0},
		{"reverseengineeringlevel", 5, 5, 0},
	},

	customizationStringName = {},
	customizationValues = {}
}


addLootItemTemplate("engine_novaldex_singularity", engine_novaldex_singularity)
