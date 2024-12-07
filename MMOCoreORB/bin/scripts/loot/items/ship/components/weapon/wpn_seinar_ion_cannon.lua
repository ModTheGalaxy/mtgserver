wpn_seinar_ion_cannon = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/tangible/ship/components/weapon/wpn_seinar_ion_cannon.iff",
	craftingValues = {
		{"ship_component_weapon_damage_minimum", 225.5, 521.3, 1},
		{"ship_component_weapon_damage_maximum", 303.2, 701, 1},
		{"ship_component_weapon_effectiveness_shields", 751, 999, 3},
		{"ship_component_weapon_effectiveness_armor", 321, 429, 3},
		{"ship_component_weapon_energy_per_shot", 37.8, 13.2, 1},
		{"ship_component_weapon_refire_rate", 486, 364, 3},
		{"ship_component_hitpoints", 160.9, 214.1, 1},
		{"ship_component_armor", 80.4, 107.1, 1},
		{"ship_component_energy_required", 3258, 1142, 0},
		{"ship_component_mass", 2592, 908, 0},
		{"reverseengineeringlevel", 2, 2, 0},
	},

	customizationStringName = {},
	customizationValues = {}
}


addLootItemTemplate("wpn_seinar_ion_cannon", wpn_seinar_ion_cannon)
