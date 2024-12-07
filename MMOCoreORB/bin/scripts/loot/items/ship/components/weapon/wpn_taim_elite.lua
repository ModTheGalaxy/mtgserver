wpn_taim_elite = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/tangible/ship/components/weapon/wpn_taim_elite.iff",
	craftingValues = {
		{"ship_component_weapon_damage_minimum", 1472.4, 2985.5, 1},
		{"ship_component_weapon_damage_maximum", 2385.1, 4836.2, 1},
		{"ship_component_weapon_effectiveness_shields", 536, 714, 3},
		{"ship_component_weapon_effectiveness_armor", 536, 714, 3},
		{"ship_component_weapon_energy_per_shot", 55.3, 19.3, 1},
		{"ship_component_weapon_refire_rate", 486, 364, 3},
		{"ship_component_hitpoints", 1180.9, 1570, 1},
		{"ship_component_armor", 590.4, 785, 1},
		{"ship_component_energy_required", 3258, 1142, 0},
		{"ship_component_mass", 83519, 29281, 0},
		{"reverseengineeringlevel", 10, 10, 0},
	},

	customizationStringName = {},
	customizationValues = {}
}


addLootItemTemplate("wpn_taim_elite", wpn_taim_elite)
