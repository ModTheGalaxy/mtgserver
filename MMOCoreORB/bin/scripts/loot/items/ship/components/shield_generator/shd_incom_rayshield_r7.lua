shd_incom_rayshield_r7 = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/tangible/ship/components/shield_generator/shd_incom_rayshield_r7.iff",
	craftingValues = {
		{"ship_component_shield_recharge_rate", 0.5, 3.3, 1},
		{"ship_component_shield_hitpoints_front", 49.7, 497.5, 1},
		{"ship_component_shield_hitpoints_back", 49.7, 497.5, 1},
		{"ship_component_hitpoints", 152.9, 203.4, 1},
		{"ship_component_armor", 76.4, 101.7, 1},
		{"ship_component_energy_required", 4725, 472, 0},
		{"ship_component_mass", 3165, 877, 0},
		{"reverseengineeringlevel", 2, 2, 0},
	},

	customizationStringName = {},
	customizationValues = {}
}


addLootItemTemplate("shd_incom_rayshield_r7", shd_incom_rayshield_r7)
