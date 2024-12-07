shd_cygnus_elite = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/tangible/ship/components/shield_generator/shd_cygnus_elite.iff",
	craftingValues = {
		{"ship_component_shield_recharge_rate", 3.6, 24.2, 1},
		{"ship_component_shield_hitpoints_front", 364.9, 3649.6, 1},
		{"ship_component_shield_hitpoints_back", 364.9, 3649.6, 1},
		{"ship_component_hitpoints", 1121.9, 1491.5, 1},
		{"ship_component_armor", 560.9, 745.8, 1},
		{"ship_component_energy_required", 5650, 564, 0},
		{"ship_component_mass", 93088, 25822, 0},
		{"reverseengineeringlevel", 10, 10, 0},
	},

	customizationStringName = {},
	customizationValues = {}
}


addLootItemTemplate("shd_cygnus_elite", shd_cygnus_elite)
