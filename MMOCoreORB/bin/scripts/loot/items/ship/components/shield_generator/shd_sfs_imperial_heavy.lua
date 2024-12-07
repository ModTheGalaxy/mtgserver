shd_sfs_imperial_heavy = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/tangible/ship/components/shield_generator/shd_sfs_imperial_heavy.iff",
	craftingValues = {
		{"ship_component_shield_recharge_rate", 1.3, 10.5, 1},
		{"ship_component_shield_hitpoints_front", 173.8, 1738.7, 1},
		{"ship_component_shield_hitpoints_back", 173.8, 1738.7, 1},
		{"ship_component_hitpoints", 599.5, 797.1, 1},
		{"ship_component_armor", 299.7, 398.6, 1},
		{"ship_component_energy_required", 5187, 518, 0},
		{"ship_component_mass", 15070, 4180, 0},
		{"reverseengineeringlevel", 5, 5, 0},
	},

	customizationStringName = {},
	customizationValues = {}
}


addLootItemTemplate("shd_sfs_imperial_heavy", shd_sfs_imperial_heavy)
