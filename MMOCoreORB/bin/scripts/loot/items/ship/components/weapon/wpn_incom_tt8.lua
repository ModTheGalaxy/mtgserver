wpn_incom_tt8 = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/tangible/ship/components/weapon/wpn_incom_tt8.iff",
	craftingValues = {
		{"ship_component_weapon_damage_minimum", 540.1, 1028.1, 1},
		{"ship_component_weapon_damage_maximum", 760.9, 1448.4, 1},
		{"ship_component_weapon_effectiveness_shields", 536, 714, 3},
		{"ship_component_weapon_effectiveness_armor", 536, 714, 3},
		{"ship_component_weapon_energy_per_shot", 41.6, 14.5, 1},
		{"ship_component_weapon_refire_rate", 486, 364, 3},
		{"ship_component_hitpoints", 444.3, 590.7, 1},
		{"ship_component_armor", 222.1, 295.4, 1},
		{"ship_component_energy_required", 3110, 1090, 0},
		{"ship_component_mass", 7451, 2612, 0},
		{"reverseengineeringlevel", 4, 4, 0},
	},

	customizationStringName = {},
	customizationValues = {}
}


addLootItemTemplate("wpn_incom_tt8", wpn_incom_tt8)
