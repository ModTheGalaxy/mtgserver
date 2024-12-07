wpn_incom_light_blaster = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/tangible/ship/components/weapon/wpn_incom_light_blaster.iff",
	craftingValues = {
		{"ship_component_weapon_damage_minimum", 191.5, 388.5, 1},
		{"ship_component_weapon_damage_maximum", 257.6, 522.4, 1},
		{"ship_component_weapon_effectiveness_shields", 429, 571, 3},
		{"ship_component_weapon_effectiveness_armor", 429, 571, 3},
		{"ship_component_weapon_energy_per_shot", 30.3, 10.5, 1},
		{"ship_component_weapon_refire_rate", 389, 291, 3},
		{"ship_component_hitpoints", 115.9, 154.1, 1},
		{"ship_component_armor", 57.9, 77.1, 1},
		{"ship_component_energy_required", 2962, 1038, 0},
		{"ship_component_mass", 1333, 467, 0},
		{"reverseengineeringlevel", 1, 1, 0},
	},

	customizationStringName = {},
	customizationValues = {}
}


addLootItemTemplate("wpn_incom_light_blaster", wpn_incom_light_blaster)
