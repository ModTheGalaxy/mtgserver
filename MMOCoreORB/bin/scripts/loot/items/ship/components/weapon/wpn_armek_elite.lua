wpn_armek_elite = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/tangible/ship/components/weapon/wpn_armek_elite.iff",
	craftingValues = {
		{"ship_component_weapon_damage_minimum", 1636, 3317.3, 1},
		{"ship_component_weapon_damage_maximum", 2650.1, 5373.5, 1},
		{"ship_component_weapon_effectiveness_shields", 643, 857, 3},
		{"ship_component_weapon_effectiveness_armor", 483, 643, 3},
		{"ship_component_weapon_energy_per_shot", 55.3, 19.3, 1},
		{"ship_component_weapon_refire_rate", 486, 364, 3},
		{"ship_component_hitpoints", 1062.8, 1413, 1},
		{"ship_component_armor", 531.4, 706.5, 1},
		{"ship_component_energy_required", 3554, 1246, 0},
		{"ship_component_mass", 76560, 26840, 0},
		{"reverseengineeringlevel", 10, 10, 0},
	},

	customizationStringName = {},
	customizationValues = {}
}


addLootItemTemplate("wpn_armek_elite", wpn_armek_elite)
