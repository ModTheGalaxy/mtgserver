shd_kse_enhanced_military_mk1 = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/tangible/ship/components/shield_generator/shd_kse_enhanced_military_mk1.iff",
	craftingValues = {
		{"ship_component_shield_recharge_rate", 0.5, 3.3, 1},
		{"ship_component_shield_hitpoints_front", 49.1, 491.2, 1},
		{"ship_component_shield_hitpoints_back", 49.1, 491.2, 1},
		{"ship_component_hitpoints", 160.9, 214.1, 1},
		{"ship_component_armor", 80.4, 107.1, 1},
		{"ship_component_energy_required", 4002, 1110, 0},
		{"ship_component_mass", 3014, 836, 0},
		{"reverseengineeringlevel", 2, 2, 0},
	},

	customizationStringName = {},
	customizationValues = {}
}


addLootItemTemplate("shd_kse_enhanced_military_mk1", shd_kse_enhanced_military_mk1)
