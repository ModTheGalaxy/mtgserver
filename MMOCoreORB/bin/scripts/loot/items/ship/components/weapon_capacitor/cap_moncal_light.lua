cap_moncal_light = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/tangible/ship/components/weapon_capacitor/cap_moncal_light.iff",
	craftingValues = {
		{"ship_component_capacitor_energy", 165.9, 784.1, 1},
		{"ship_component_capacitor_energy_recharge_rate", 8.2, 29.8, 1},
		{"ship_component_hitpoints", 128.7, 171.3, 1},
		{"ship_component_armor", 64.3, 85.7, 1},
		{"ship_component_energy_required", 1623, 377, 0},
		{"ship_component_mass", 1163, 537, 0},
		{"reverseengineeringlevel", 1, 1, 0},
	},

	customizationStringName = {},
	customizationValues = {}
}


addLootItemTemplate("cap_moncal_light", cap_moncal_light)
