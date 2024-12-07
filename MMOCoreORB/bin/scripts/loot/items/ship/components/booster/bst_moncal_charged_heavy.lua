bst_moncal_charged_heavy = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/tangible/ship/components/booster/bst_moncal_charged_heavy.iff",
	craftingValues = {
		{"ship_component_booster_energy", 1301.6, 2328.4, 1},
		{"ship_component_booster_energy_recharge_rate", 32.5, 58.3, 1},
		{"ship_component_booster_energy_consumption_rate", 232.9, 130.1, 1},
		{"ship_component_booster_acceleration", 32.1, 40.5, 1},
		{"ship_component_booster_speed_maximum", 25.3, 30.1, 1},
		{"ship_component_hitpoints", 817.5, 1086.9, 1},
		{"ship_component_armor", 408.7, 543.5, 1},
		{"ship_component_energy_required", 784, 316, 0},
		{"ship_component_mass", 13693, 5535, 0},
		{"reverseengineeringlevel", 6, 6, 0},
	},

	customizationStringName = {},
	customizationValues = {}
}


addLootItemTemplate("bst_moncal_charged_heavy", bst_moncal_charged_heavy)
