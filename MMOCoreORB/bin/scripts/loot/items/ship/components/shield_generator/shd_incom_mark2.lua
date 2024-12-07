shd_incom_mark2 = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/tangible/ship/components/shield_generator/shd_incom_mark2.iff",
	craftingValues = {
		{"ship_component_shield_recharge_rate", 0.4, 2.6, 1},
		{"ship_component_shield_hitpoints_front", 39.2, 392.9, 1},
		{"ship_component_shield_hitpoints_back", 39.2, 392.9, 1},
		{"ship_component_hitpoints", 137.2, 162.8, 1},
		{"ship_component_armor", 68.6, 81.4, 1},
		{"ship_component_energy_required", 4725, 472, 0},
		{"ship_component_mass", 1895, 525, 0},
		{"reverseengineeringlevel", 1, 1, 0},
	},

	customizationStringName = {},
	customizationValues = {}
}


addLootItemTemplate("shd_incom_mark2", shd_incom_mark2)
