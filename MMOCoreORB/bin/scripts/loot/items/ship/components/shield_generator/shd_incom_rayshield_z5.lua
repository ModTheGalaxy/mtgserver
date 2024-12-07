shd_incom_rayshield_z5 = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/tangible/ship/components/shield_generator/shd_incom_rayshield_z5.iff",
	craftingValues = {
		{"ship_component_shield_recharge_rate", 2.1, 14, 1},
		{"ship_component_shield_hitpoints_front", 210.5, 2105.4, 1},
		{"ship_component_shield_hitpoints_back", 210.5, 2105.4, 1},
		{"ship_component_hitpoints", 647.2, 860.5, 1},
		{"ship_component_armor", 323.6, 430.3, 1},
		{"ship_component_energy_required", 5187, 518, 0},
		{"ship_component_mass", 21638, 6002, 0},
		{"reverseengineeringlevel", 6, 6, 0},
	},

	customizationStringName = {},
	customizationValues = {}
}


addLootItemTemplate("shd_incom_rayshield_z5", shd_incom_rayshield_z5)
