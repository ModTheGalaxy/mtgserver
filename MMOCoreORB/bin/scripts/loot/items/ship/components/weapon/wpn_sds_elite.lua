wpn_sds_elite = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/tangible/ship/components/weapon/wpn_sds_elite.iff",
	craftingValues = {
		{"ship_component_weapon_damage_minimum", 1308.8, 2653.8, 1},
		{"ship_component_weapon_damage_maximum", 2120.1, 4298.8, 1},
		{"ship_component_weapon_effectiveness_shields", 429, 571, 3},
		{"ship_component_weapon_effectiveness_armor", 429, 571, 3},
		{"ship_component_weapon_energy_per_shot", 44.3, 15.5, 1},
		{"ship_component_weapon_refire_rate", 389, 291, 3},
		{"ship_component_hitpoints", 1039.2, 1381.6, 1},
		{"ship_component_armor", 519.6, 690.8, 1},
		{"ship_component_energy_required", 3554, 1246, 0},
		{"ship_component_mass", 75079, 26321, 0},
		{"reverseengineeringlevel", 9, 9, 0},
	},

	customizationStringName = {},
	customizationValues = {}
}


addLootItemTemplate("wpn_sds_elite", wpn_sds_elite)
