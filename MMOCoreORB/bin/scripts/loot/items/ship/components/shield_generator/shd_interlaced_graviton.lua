shd_interlaced_graviton = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/tangible/ship/components/shield_generator/shd_interlaced_graviton.iff",
	craftingValues = {
		{"ship_component_shield_recharge_rate", 2.3, 20, 1},
		{"ship_component_shield_hitpoints_front", 288.2, 2882.3, 1},
		{"ship_component_shield_hitpoints_back", 288.2, 2882.3, 1},
		{"ship_component_hitpoints", 1007, 1193.8, 1},
		{"ship_component_armor", 503.5, 596.9, 1},
		{"ship_component_energy_required", 5650, 564, 0},
		{"ship_component_mass", 100752, 27948, 0},
		{"reverseengineeringlevel", 9, 9, 0},
	},

	customizationStringName = {},
	customizationValues = {}
}


addLootItemTemplate("shd_interlaced_graviton", shd_interlaced_graviton)
