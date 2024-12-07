shd_unknown_proton_projector = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/tangible/ship/components/shield_generator/shd_unknown_proton_projector.iff",
	craftingValues = {
		{"ship_component_shield_recharge_rate", 0.7, 3.1, 1},
		{"ship_component_shield_hitpoints_front", 47.6, 476.3, 1},
		{"ship_component_shield_hitpoints_back", 47.6, 476.3, 1},
		{"ship_component_hitpoints", 166.2, 208.8, 1},
		{"ship_component_armor", 83.1, 104.4, 1},
		{"ship_component_energy_required", 4002, 1110, 0},
		{"ship_component_mass", 2470, 1380, 0},
		{"reverseengineeringlevel", 2, 2, 0},
	},

	customizationStringName = {},
	customizationValues = {}
}


addLootItemTemplate("shd_unknown_proton_projector", shd_unknown_proton_projector)
