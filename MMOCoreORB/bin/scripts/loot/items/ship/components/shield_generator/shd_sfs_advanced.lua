shd_sfs_advanced = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/tangible/ship/components/shield_generator/shd_sfs_advanced.iff",
	craftingValues = {
		{"ship_component_shield_recharge_rate", 4.9, 12.4, 1},
		{"ship_component_shield_hitpoints_front", 207.8, 2078.5, 1},
		{"ship_component_shield_hitpoints_back", 207.8, 2078.5, 1},
		{"ship_component_hitpoints", 681.2, 905.8, 1},
		{"ship_component_armor", 340.6, 452.9, 1},
		{"ship_component_energy_required", 5187, 518, 0},
		{"ship_component_mass", 20698, 5741, 0},
		{"reverseengineeringlevel", 6, 6, 0},
	},

	customizationStringName = {},
	customizationValues = {}
}


addLootItemTemplate("shd_sfs_advanced", shd_sfs_advanced)
