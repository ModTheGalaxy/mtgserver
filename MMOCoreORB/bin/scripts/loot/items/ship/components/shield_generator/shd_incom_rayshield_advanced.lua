shd_incom_rayshield_advanced = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/tangible/ship/components/shield_generator/shd_incom_rayshield_advanced.iff",
	craftingValues = {
		{"ship_component_shield_recharge_rate", 2.5, 16.5, 1},
		{"ship_component_shield_hitpoints_front", 244.7, 2447.6, 1},
		{"ship_component_shield_hitpoints_back", 244.7, 2447.6, 1},
		{"ship_component_hitpoints", 802.2, 1066.6, 1},
		{"ship_component_armor", 401.1, 533.3, 1},
		{"ship_component_energy_required", 5419, 541, 0},
		{"ship_component_mass", 25316, 14152, 0},
		{"reverseengineeringlevel", 7, 7, 0},
	},

	customizationStringName = {},
	customizationValues = {}
}


addLootItemTemplate("shd_incom_rayshield_advanced", shd_incom_rayshield_advanced)
