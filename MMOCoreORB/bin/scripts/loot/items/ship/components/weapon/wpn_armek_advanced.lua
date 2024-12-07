wpn_armek_advanced = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/tangible/ship/components/weapon/wpn_armek_advanced.iff",
	craftingValues = {
		{"ship_component_weapon_damage_minimum", 1308.8, 2653.8, 1},
		{"ship_component_weapon_damage_maximum", 2120.1, 4298.8, 1},
		{"ship_component_weapon_effectiveness_shields", 515, 685, 3},
		{"ship_component_weapon_effectiveness_armor", 386, 514, 3},
		{"ship_component_weapon_energy_per_shot", 44.3, 15.5, 1},
		{"ship_component_weapon_refire_rate", 389, 291, 3},
		{"ship_component_hitpoints", 850.2, 1130.4, 1},
		{"ship_component_armor", 425.1, 565.2, 1},
		{"ship_component_energy_required", 3554, 1246, 0},
		{"ship_component_mass", 63528, 22272, 0},
		{"reverseengineeringlevel", 9, 9, 0},
	},

	customizationStringName = {},
	customizationValues = {}
}


addLootItemTemplate("wpn_armek_advanced", wpn_armek_advanced)
