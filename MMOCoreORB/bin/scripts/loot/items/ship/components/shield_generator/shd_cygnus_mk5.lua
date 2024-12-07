shd_cygnus_mk5 = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/tangible/ship/components/shield_generator/shd_cygnus_mk5.iff",
	craftingValues = {
		{"ship_component_shield_recharge_rate", 6.9, 17.2, 1},
		{"ship_component_shield_hitpoints_front", 289.8, 2898.9, 1},
		{"ship_component_shield_hitpoints_back", 289.8, 2898.9, 1},
		{"ship_component_hitpoints", 944.7, 1256, 1},
		{"ship_component_armor", 472.3, 628, 1},
		{"ship_component_energy_required", 5650, 564, 0},
		{"ship_component_mass", 80602, 22358, 0},
		{"reverseengineeringlevel", 9, 9, 0},
	},

	customizationStringName = {},
	customizationValues = {}
}


addLootItemTemplate("shd_cygnus_mk5", shd_cygnus_mk5)
