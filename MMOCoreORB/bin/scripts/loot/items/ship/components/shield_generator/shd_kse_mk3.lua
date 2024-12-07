shd_kse_mk3 = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/tangible/ship/components/shield_generator/shd_kse_mk3.iff",
	craftingValues = {
		{"ship_component_shield_recharge_rate", 1.7, 11.2, 1},
		{"ship_component_shield_hitpoints_front", 166.2, 1662.8, 1},
		{"ship_component_shield_hitpoints_back", 166.2, 1662.8, 1},
		{"ship_component_hitpoints", 545, 724.6, 1},
		{"ship_component_armor", 272.5, 362.3, 1},
		{"ship_component_energy_required", 5187, 518, 0},
		{"ship_component_mass", 9702, 5423, 0},
		{"reverseengineeringlevel", 5, 5, 0},
	},

	customizationStringName = {},
	customizationValues = {}
}


addLootItemTemplate("shd_kse_mk3", shd_kse_mk3)
