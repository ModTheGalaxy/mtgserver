shd_moncal = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/tangible/ship/components/shield_generator/shd_moncal.iff",
	craftingValues = {
		{"ship_component_shield_recharge_rate", 0.9, 7.9, 1},
		{"ship_component_shield_hitpoints_front", 112.9, 1129.6, 1},
		{"ship_component_shield_hitpoints_back", 112.9, 1129.6, 1},
		{"ship_component_hitpoints", 394.6, 467.9, 1},
		{"ship_component_armor", 197.3, 234, 1},
		{"ship_component_energy_required", 4956, 495, 0},
		{"ship_component_mass", 9796, 2717, 0},
		{"reverseengineeringlevel", 4, 4, 0},
	},

	customizationStringName = {},
	customizationValues = {}
}


addLootItemTemplate("shd_moncal", shd_moncal)
