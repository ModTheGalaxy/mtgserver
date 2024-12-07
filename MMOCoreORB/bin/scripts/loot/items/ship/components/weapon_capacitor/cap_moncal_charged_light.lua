cap_moncal_charged_light = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/tangible/ship/components/weapon_capacitor/cap_moncal_charged_light.iff",
	craftingValues = {
		{"ship_component_capacitor_energy", 248.9, 1176.1, 1},
		{"ship_component_capacitor_energy_recharge_rate", 13.6, 49.4, 1},
		{"ship_component_hitpoints", 193.1, 256.9, 1},
		{"ship_component_armor", 96.5, 128.5, 1},
		{"ship_component_energy_required", 1704, 396, 0},
		{"ship_component_mass", 2274, 1051, 0},
		{"reverseengineeringlevel", 2, 2, 0},
	},

	customizationStringName = {},
	customizationValues = {}
}


addLootItemTemplate("cap_moncal_charged_light", cap_moncal_charged_light)
