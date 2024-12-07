shd_taim_heavy = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/tangible/ship/components/shield_generator/shd_taim_heavy.iff",
	craftingValues = {
		{"ship_component_shield_recharge_rate", 2.5, 16.5, 1},
		{"ship_component_shield_hitpoints_front", 247.9, 2479.3, 1},
		{"ship_component_shield_hitpoints_back", 247.9, 2479.3, 1},
		{"ship_component_hitpoints", 762.1, 1013.3, 1},
		{"ship_component_armor", 381, 506.7, 1},
		{"ship_component_energy_required", 5419, 541, 0},
		{"ship_component_mass", 31032, 8608, 0},
		{"reverseengineeringlevel", 7, 7, 0},
	},

	customizationStringName = {},
	customizationValues = {}
}


addLootItemTemplate("shd_taim_heavy", shd_taim_heavy)
