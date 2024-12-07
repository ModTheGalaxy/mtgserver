shd_taim_elite = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/tangible/ship/components/shield_generator/shd_taim_elite.iff",
	craftingValues = {
		{"ship_component_shield_recharge_rate", 8.6, 21.5, 1},
		{"ship_component_shield_hitpoints_front", 362.3, 3623.6, 1},
		{"ship_component_shield_hitpoints_back", 362.3, 3623.6, 1},
		{"ship_component_hitpoints", 1180.9, 1570, 1},
		{"ship_component_armor", 590.4, 785, 1},
		{"ship_component_energy_required", 5650, 564, 0},
		{"ship_component_mass", 97136, 26944, 0},
		{"reverseengineeringlevel", 10, 10, 0},
	},

	customizationStringName = {},
	customizationValues = {}
}


addLootItemTemplate("shd_taim_elite", shd_taim_elite)
