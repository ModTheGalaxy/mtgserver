wpn_sfs_elite = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/tangible/ship/components/weapon/wpn_sfs_elite.iff",
	craftingValues = {
		{"ship_component_weapon_damage_minimum", 1177.9, 2388.4, 1},
		{"ship_component_weapon_damage_maximum", 1908.1, 3868.9, 1},
		{"ship_component_weapon_effectiveness_shields", 429, 571, 3},
		{"ship_component_weapon_effectiveness_armor", 429, 571, 3},
		{"ship_component_weapon_energy_per_shot", 44.3, 15.5, 1},
		{"ship_component_weapon_refire_rate", 389, 291, 3},
		{"ship_component_hitpoints", 944.7, 1256, 1},
		{"ship_component_armor", 472.3, 628, 1},
		{"ship_component_energy_required", 3258, 1142, 0},
		{"ship_component_mass", 69303, 24297, 0},
		{"reverseengineeringlevel", 9, 9, 0},
	},

	customizationStringName = {},
	customizationValues = {}
}


addLootItemTemplate("wpn_sfs_elite", wpn_sfs_elite)
