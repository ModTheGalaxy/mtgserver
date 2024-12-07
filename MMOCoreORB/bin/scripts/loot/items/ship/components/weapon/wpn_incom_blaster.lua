wpn_incom_blaster = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/tangible/ship/components/weapon/wpn_incom_blaster.iff",
	craftingValues = {
		{"ship_component_weapon_damage_minimum", 215.5, 437, 1},
		{"ship_component_weapon_damage_maximum", 289.8, 587.7, 1},
		{"ship_component_weapon_effectiveness_shields", 536, 714, 3},
		{"ship_component_weapon_effectiveness_armor", 536, 714, 3},
		{"ship_component_weapon_energy_per_shot", 37.8, 13.2, 1},
		{"ship_component_weapon_refire_rate", 486, 364, 3},
		{"ship_component_hitpoints", 160.9, 214.1, 1},
		{"ship_component_armor", 80.4, 107.1, 1},
		{"ship_component_energy_required", 2666, 934, 0},
		{"ship_component_mass", 2592, 908, 0},
		{"reverseengineeringlevel", 2, 2, 0},
	},

	customizationStringName = {},
	customizationValues = {}
}


addLootItemTemplate("wpn_incom_blaster", wpn_incom_blaster)
