wpn_kse_light_disruptor = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/tangible/ship/components/weapon/wpn_kse_light_disruptor.iff",
	craftingValues = {
		{"ship_component_weapon_damage_minimum", 191.5, 388.5, 1},
		{"ship_component_weapon_damage_maximum", 257.6, 522.4, 1},
		{"ship_component_weapon_effectiveness_shields", 257, 343, 3},
		{"ship_component_weapon_effectiveness_armor", 601, 799, 3},
		{"ship_component_weapon_energy_per_shot", 30.3, 10.5, 1},
		{"ship_component_weapon_refire_rate", 389, 291, 3},
		{"ship_component_hitpoints", 128.7, 171.3, 1},
		{"ship_component_armor", 64.3, 85.7, 1},
		{"ship_component_energy_required", 2873, 1007, 0},
		{"ship_component_mass", 1437, 503, 0},
		{"reverseengineeringlevel", 1, 1, 0},
	},

	customizationStringName = {},
	customizationValues = {}
}


addLootItemTemplate("wpn_kse_light_disruptor", wpn_kse_light_disruptor)
