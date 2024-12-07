wpn_hk_scorcher_elite = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/tangible/ship/components/weapon/wpn_hk_scorcher_elite.iff",
	craftingValues = {
		{"ship_component_weapon_damage_minimum", 1308.8, 2653.8, 1},
		{"ship_component_weapon_damage_maximum", 2120.1, 4298.8, 1},
		{"ship_component_weapon_effectiveness_shields", 515, 685, 3},
		{"ship_component_weapon_effectiveness_armor", 515, 685, 3},
		{"ship_component_weapon_energy_per_shot", 48, 16.7, 1},
		{"ship_component_weapon_refire_rate", 466, 350, 3},
		{"ship_component_hitpoints", 944.7, 1256, 1},
		{"ship_component_armor", 472.3, 628, 1},
		{"ship_component_energy_required", 3554, 1246, 0},
		{"ship_component_mass", 77966, 27334, 0},
		{"reverseengineeringlevel", 9, 9, 0},
	},

	customizationStringName = {},
	customizationValues = {}
}


addLootItemTemplate("wpn_hk_scorcher_elite", wpn_hk_scorcher_elite)
