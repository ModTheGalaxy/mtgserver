bst_corellian_elite_thrust_enhancer = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/tangible/ship/components/booster/bst_corellian_elite_thrust_enhancer.iff",
	craftingValues = {
		{"ship_component_booster_energy", 1049.9, 1878.3, 1},
		{"ship_component_booster_energy_recharge_rate", 26.2, 47, 1},
		{"ship_component_booster_energy_consumption_rate", 187.9, 104.9, 1},
		{"ship_component_booster_acceleration", 25.9, 32.6, 1},
		{"ship_component_booster_speed_maximum", 20.8, 24.8, 1},
		{"ship_component_hitpoints", 944.7, 1256, 1},
		{"ship_component_armor", 472.3, 628, 1},
		{"ship_component_energy_required", 855, 345, 0},
		{"ship_component_mass", 53325, 21555, 0},
		{"reverseengineeringlevel", 9, 9, 0},
	},

	customizationStringName = {},
	customizationValues = {}
}


addLootItemTemplate("bst_corellian_elite_thrust_enhancer", bst_corellian_elite_thrust_enhancer)
