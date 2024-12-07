wpn_slayn_ioncannon = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/tangible/ship/components/weapon/wpn_slayn_ioncannon.iff",
	craftingValues = {
		{"ship_component_weapon_damage_minimum", 402.2, 815.8, 1},
		{"ship_component_weapon_damage_maximum", 566.7, 1149.3, 1},
		{"ship_component_weapon_effectiveness_shields", 601, 799, 3},
		{"ship_component_weapon_effectiveness_armor", 257, 343, 3},
		{"ship_component_weapon_energy_per_shot", 33.3, 11.6, 1},
		{"ship_component_weapon_refire_rate", 389, 291, 3},
		{"ship_component_hitpoints", 296.2, 393.8, 1},
		{"ship_component_armor", 148.1, 196.9, 1},
		{"ship_component_energy_required", 3110, 1090, 0},
		{"ship_component_mass", 3888, 1362, 0},
		{"reverseengineeringlevel", 3, 3, 0},
	},

	customizationStringName = {},
	customizationValues = {}
}


addLootItemTemplate("wpn_slayn_ioncannon", wpn_slayn_ioncannon)
