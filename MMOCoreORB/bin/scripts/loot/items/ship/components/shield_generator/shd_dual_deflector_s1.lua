shd_dual_deflector_s1 = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/tangible/ship/components/shield_generator/shd_dual_deflector_s1.iff",
	craftingValues = {
		{"ship_component_shield_recharge_rate", 0.9, 2.4, 1},
		{"ship_component_shield_hitpoints_front", 39.2, 392.9, 1},
		{"ship_component_shield_hitpoints_back", 39.2, 392.9, 1},
		{"ship_component_hitpoints", 128.7, 171.3, 1},
		{"ship_component_armor", 64.3, 85.7, 1},
		{"ship_component_energy_required", 4725, 472, 0},
		{"ship_component_mass", 1723, 477, 0},
		{"reverseengineeringlevel", 1, 1, 0},
	},

	customizationStringName = {},
	customizationValues = {}
}


addLootItemTemplate("shd_dual_deflector_s1", shd_dual_deflector_s1)
