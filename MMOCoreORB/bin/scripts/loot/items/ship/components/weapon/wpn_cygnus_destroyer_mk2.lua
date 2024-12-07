wpn_cygnus_destroyer_mk2 = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/tangible/ship/components/weapon/wpn_cygnus_destroyer_mk2.iff",
	craftingValues = {
		{"ship_component_weapon_damage_minimum", 402.2, 815.8, 1},
		{"ship_component_weapon_damage_maximum", 566.7, 1149.3, 1},
		{"ship_component_weapon_effectiveness_shields", 429, 571, 3},
		{"ship_component_weapon_effectiveness_armor", 429, 571, 3},
		{"ship_component_weapon_energy_per_shot", 33.3, 11.6, 1},
		{"ship_component_weapon_refire_rate", 389, 291, 3},
		{"ship_component_hitpoints", 325.8, 433.2, 1},
		{"ship_component_armor", 162.9, 216.6, 1},
		{"ship_component_energy_required", 3110, 1090, 0},
		{"ship_component_mass", 4258, 1492, 0},
		{"reverseengineeringlevel", 3, 3, 0},
	},

	customizationStringName = {},
	customizationValues = {}
}


addLootItemTemplate("wpn_cygnus_destroyer_mk2", wpn_cygnus_destroyer_mk2)
