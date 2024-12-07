shd_armek_plasma_shell_elite = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/tangible/ship/components/shield_generator/shd_armek_plasma_shell_elite.iff",
	craftingValues = {
		{"ship_component_shield_recharge_rate", 2.4, 18.2, 1},
		{"ship_component_shield_hitpoints_front", 301.3, 3013.9, 1},
		{"ship_component_shield_hitpoints_back", 301.3, 3013.9, 1},
		{"ship_component_hitpoints", 1039.2, 1381.6, 1},
		{"ship_component_armor", 519.6, 690.8, 1},
		{"ship_component_energy_required", 5650, 564, 0},
		{"ship_component_mass", 100752, 27948, 0},
		{"reverseengineeringlevel", 9, 9, 0},
	},

	customizationStringName = {},
	customizationValues = {}
}


addLootItemTemplate("shd_armek_plasma_shell_elite", shd_armek_plasma_shell_elite)
