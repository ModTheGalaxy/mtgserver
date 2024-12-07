shd_cygnus_mk3 = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/tangible/ship/components/shield_generator/shd_cygnus_mk3.iff",
	craftingValues = {
		{"ship_component_shield_recharge_rate", 3, 13.1, 1},
		{"ship_component_shield_hitpoints_front", 201.5, 2015.6, 1},
		{"ship_component_shield_hitpoints_back", 201.5, 2015.6, 1},
		{"ship_component_hitpoints", 703.7, 883.3, 1},
		{"ship_component_armor", 351.8, 441.7, 1},
		{"ship_component_energy_required", 4394, 1218, 0},
		{"ship_component_mass", 16959, 9480, 0},
		{"reverseengineeringlevel", 6, 6, 0},
	},

	customizationStringName = {},
	customizationValues = {}
}


addLootItemTemplate("shd_cygnus_mk3", shd_cygnus_mk3)
