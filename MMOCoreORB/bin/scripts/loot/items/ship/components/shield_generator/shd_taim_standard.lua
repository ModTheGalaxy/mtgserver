shd_taim_standard = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/tangible/ship/components/shield_generator/shd_taim_standard.iff",
	craftingValues = {
		{"ship_component_shield_recharge_rate", 1.2, 8.5, 1},
		{"ship_component_shield_hitpoints_front", 112.9, 1129.6, 1},
		{"ship_component_shield_hitpoints_back", 112.9, 1129.6, 1},
		{"ship_component_hitpoints", 370.2, 492.3, 1},
		{"ship_component_armor", 185.1, 246.2, 1},
		{"ship_component_energy_required", 5722, 572, 0},
		{"ship_component_mass", 7912, 2194, 0},
		{"reverseengineeringlevel", 4, 4, 0},
	},

	customizationStringName = {},
	customizationValues = {}
}


addLootItemTemplate("shd_taim_standard", shd_taim_standard)
