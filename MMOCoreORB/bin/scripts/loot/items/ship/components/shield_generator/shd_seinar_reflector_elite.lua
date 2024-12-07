shd_seinar_reflector_elite = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/tangible/ship/components/shield_generator/shd_seinar_reflector_elite.iff",
	craftingValues = {
		{"ship_component_shield_recharge_rate", 0.7, 6.3, 1},
		{"ship_component_shield_hitpoints_front", 90.3, 903.7, 1},
		{"ship_component_shield_hitpoints_back", 90.3, 903.7, 1},
		{"ship_component_hitpoints", 315.7, 374.3, 1},
		{"ship_component_armor", 157.8, 187.2, 1},
		{"ship_component_energy_required", 4956, 495, 0},
		{"ship_component_mass", 5598, 1552, 0},
		{"reverseengineeringlevel", 3, 3, 0},
	},

	customizationStringName = {},
	customizationValues = {}
}


addLootItemTemplate("shd_seinar_reflector_elite", shd_seinar_reflector_elite)
