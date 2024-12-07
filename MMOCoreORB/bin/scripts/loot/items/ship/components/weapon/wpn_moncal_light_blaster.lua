wpn_moncal_light_blaster = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/tangible/ship/components/weapon/wpn_moncal_light_blaster.iff",
	craftingValues = {
		{"ship_component_weapon_damage_minimum", 229.2, 495.8, 1},
		{"ship_component_weapon_damage_maximum", 308.2, 666.8, 1},
		{"ship_component_weapon_effectiveness_shields", 536, 714, 3},
		{"ship_component_weapon_effectiveness_armor", 536, 714, 3},
		{"ship_component_weapon_energy_per_shot", 37.8, 13.2, 1},
		{"ship_component_weapon_refire_rate", 486, 364, 3},
		{"ship_component_hitpoints", 160.9, 214.1, 1},
		{"ship_component_armor", 80.4, 107.1, 1},
		{"ship_component_energy_required", 2844, 996, 0},
		{"ship_component_mass", 2562, 833, 0},
		{"reverseengineeringlevel", 2, 2, 0},
	},

	customizationStringName = {},
	customizationValues = {}
}


addLootItemTemplate("wpn_moncal_light_blaster", wpn_moncal_light_blaster)
