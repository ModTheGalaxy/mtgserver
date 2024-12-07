shd_cygnus_special_mk1 = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/tangible/ship/components/shield_generator/shd_cygnus_special_mk1.iff",
	craftingValues = {
		{"ship_component_shield_recharge_rate", 0.3, 3.5, 1},
		{"ship_component_shield_hitpoints_front", 49.1, 491.2, 1},
		{"ship_component_shield_hitpoints_back", 49.1, 491.2, 1},
		{"ship_component_hitpoints", 171.5, 203.5, 1},
		{"ship_component_armor", 85.7, 101.8, 1},
		{"ship_component_energy_required", 4725, 472, 0},
		{"ship_component_mass", 3919, 1086, 0},
		{"reverseengineeringlevel", 2, 2, 0},
	},

	customizationStringName = {},
	customizationValues = {}
}


addLootItemTemplate("shd_cygnus_special_mk1", shd_cygnus_special_mk1)
