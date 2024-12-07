shd_sfs_imperial_standard = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/tangible/ship/components/shield_generator/shd_sfs_imperial_standard.iff",
	craftingValues = {
		{"ship_component_shield_recharge_rate", 1.1, 7.6, 1},
		{"ship_component_shield_hitpoints_front", 112.9, 1129.6, 1},
		{"ship_component_shield_hitpoints_back", 112.9, 1129.6, 1},
		{"ship_component_hitpoints", 370.2, 492.3, 1},
		{"ship_component_armor", 185.1, 246.2, 1},
		{"ship_component_energy_required", 4956, 495, 0},
		{"ship_component_mass", 6483, 3623, 0},
		{"reverseengineeringlevel", 4, 4, 0},
	},

	customizationStringName = {},
	customizationValues = {}
}


addLootItemTemplate("shd_sfs_imperial_standard", shd_sfs_imperial_standard)
