shd_kse_elite = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/tangible/ship/components/shield_generator/shd_kse_elite.iff",
	craftingValues = {
		{"ship_component_shield_recharge_rate", 3.2, 24.6, 1},
		{"ship_component_shield_hitpoints_front", 364.9, 3649.6, 1},
		{"ship_component_shield_hitpoints_back", 364.9, 3649.6, 1},
		{"ship_component_hitpoints", 1062.8, 1413, 1},
		{"ship_component_armor", 531.4, 706.5, 1},
		{"ship_component_energy_required", 5546, 554, 0},
		{"ship_component_mass", 105230, 29190, 0},
		{"reverseengineeringlevel", 10, 10, 0},
	},

	customizationStringName = {},
	customizationValues = {}
}


addLootItemTemplate("shd_kse_elite", shd_kse_elite)
