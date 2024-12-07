shd_kse_military_mk2 = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/tangible/ship/components/shield_generator/shd_kse_military_mk2.iff",
	craftingValues = {
		{"ship_component_shield_recharge_rate", 1.3, 5.7, 1},
		{"ship_component_shield_hitpoints_front", 87.6, 876.4, 1},
		{"ship_component_shield_hitpoints_back", 87.6, 876.4, 1},
		{"ship_component_hitpoints", 305.9, 384.1, 1},
		{"ship_component_armor", 152.9, 192.1, 1},
		{"ship_component_energy_required", 4198, 1164, 0},
		{"ship_component_mass", 3705, 2070, 0},
		{"reverseengineeringlevel", 3, 3, 0},
	},

	customizationStringName = {},
	customizationValues = {}
}


addLootItemTemplate("shd_kse_military_mk2", shd_kse_military_mk2)
