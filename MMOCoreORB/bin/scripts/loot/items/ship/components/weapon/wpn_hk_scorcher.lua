wpn_hk_scorcher = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/tangible/ship/components/weapon/wpn_hk_scorcher.iff",
	craftingValues = {
		{"ship_component_weapon_damage_minimum", 502.8, 1019.7, 1},
		{"ship_component_weapon_damage_maximum", 708.4, 1436.6, 1},
		{"ship_component_weapon_effectiveness_shields", 536, 714, 3},
		{"ship_component_weapon_effectiveness_armor", 536, 714, 3},
		{"ship_component_weapon_energy_per_shot", 41.6, 14.5, 1},
		{"ship_component_weapon_refire_rate", 486, 364, 3},
		{"ship_component_hitpoints", 407.2, 541.5, 1},
		{"ship_component_armor", 203.6, 270.8, 1},
		{"ship_component_energy_required", 3110, 1090, 0},
		{"ship_component_mass", 7451, 2612, 0},
		{"reverseengineeringlevel", 4, 4, 0},
	},

	customizationStringName = {},
	customizationValues = {}
}


addLootItemTemplate("wpn_hk_scorcher", wpn_hk_scorcher)
