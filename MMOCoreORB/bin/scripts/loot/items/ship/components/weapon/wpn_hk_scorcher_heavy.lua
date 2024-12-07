wpn_hk_scorcher_heavy = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/tangible/ship/components/weapon/wpn_hk_scorcher_heavy.iff",
	craftingValues = {
		{"ship_component_weapon_damage_minimum", 1051.5, 2132.2, 1},
		{"ship_component_weapon_damage_maximum", 1625.9, 3296.8, 1},
		{"ship_component_weapon_effectiveness_shields", 515, 685, 3},
		{"ship_component_weapon_effectiveness_armor", 515, 685, 3},
		{"ship_component_weapon_energy_per_shot", 43.6, 15.2, 1},
		{"ship_component_weapon_refire_rate", 466, 350, 3},
		{"ship_component_hitpoints", 802.2, 1066.6, 1},
		{"ship_component_armor", 401.1, 533.3, 1},
		{"ship_component_energy_required", 3406, 1194, 0},
		{"ship_component_mass", 30032, 10528, 0},
		{"reverseengineeringlevel", 7, 7, 0},
	},

	customizationStringName = {},
	customizationValues = {}
}


addLootItemTemplate("wpn_hk_scorcher_heavy", wpn_hk_scorcher_heavy)
