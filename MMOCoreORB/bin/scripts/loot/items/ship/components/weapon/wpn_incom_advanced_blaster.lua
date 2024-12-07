wpn_incom_advanced_blaster = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/tangible/ship/components/weapon/wpn_incom_advanced_blaster.iff",
	craftingValues = {
		{"ship_component_weapon_damage_minimum", 887, 1798.7, 1},
		{"ship_component_weapon_damage_maximum", 1309.2, 2654.7, 1},
		{"ship_component_weapon_effectiveness_shields", 536, 714, 3},
		{"ship_component_weapon_effectiveness_armor", 536, 714, 3},
		{"ship_component_weapon_energy_per_shot", 45.7, 16, 1},
		{"ship_component_weapon_refire_rate", 486, 364, 3},
		{"ship_component_hitpoints", 613.1, 815.2, 1},
		{"ship_component_armor", 306.5, 407.6, 1},
		{"ship_component_energy_required", 3258, 1142, 0},
		{"ship_component_mass", 16179, 5671, 0},
		{"reverseengineeringlevel", 6, 6, 0},
	},

	customizationStringName = {},
	customizationValues = {}
}


addLootItemTemplate("wpn_incom_advanced_blaster", wpn_incom_advanced_blaster)
