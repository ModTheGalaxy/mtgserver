wpn_incom_heavy_blaster = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/tangible/ship/components/weapon/wpn_incom_heavy_blaster.iff",
	craftingValues = {
		{"ship_component_weapon_damage_minimum", 1051.5, 2132.2, 1},
		{"ship_component_weapon_damage_maximum", 1625.9, 3296.8, 1},
		{"ship_component_weapon_effectiveness_shields", 429, 571, 3},
		{"ship_component_weapon_effectiveness_armor", 429, 571, 3},
		{"ship_component_weapon_energy_per_shot", 40.3, 14, 1},
		{"ship_component_weapon_refire_rate", 389, 291, 3},
		{"ship_component_hitpoints", 882.5, 1173.3, 1},
		{"ship_component_armor", 441.2, 586.7, 1},
		{"ship_component_energy_required", 3406, 1194, 0},
		{"ship_component_mass", 28877, 10123, 0},
		{"reverseengineeringlevel", 7, 7, 0},
	},

	customizationStringName = {},
	customizationValues = {}
}


addLootItemTemplate("wpn_incom_heavy_blaster", wpn_incom_heavy_blaster)
