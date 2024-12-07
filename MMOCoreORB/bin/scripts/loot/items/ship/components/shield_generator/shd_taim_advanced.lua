shd_taim_advanced = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/tangible/ship/components/shield_generator/shd_taim_advanced.iff",
	craftingValues = {
		{"ship_component_shield_recharge_rate", 3.1, 20.6, 1},
		{"ship_component_shield_hitpoints_front", 305.9, 3059.5, 1},
		{"ship_component_shield_hitpoints_back", 305.9, 3059.5, 1},
		{"ship_component_hitpoints", 1002.8, 1333.3, 1},
		{"ship_component_armor", 501.4, 666.7, 1},
		{"ship_component_energy_required", 5419, 541, 0},
		{"ship_component_mass", 44303, 24766, 0},
		{"reverseengineeringlevel", 8, 8, 0},
	},

	customizationStringName = {},
	customizationValues = {}
}


addLootItemTemplate("shd_taim_advanced", shd_taim_advanced)
