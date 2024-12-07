wpn_incom_quad_blaster = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/tangible/ship/components/weapon/wpn_incom_quad_blaster.iff",
	craftingValues = {
		{"ship_component_weapon_damage_minimum", 1314.4, 2665.2, 1},
		{"ship_component_weapon_damage_maximum", 2032.4, 4121, 1},
		{"ship_component_weapon_effectiveness_shields", 536, 714, 3},
		{"ship_component_weapon_effectiveness_armor", 536, 714, 3},
		{"ship_component_weapon_energy_per_shot", 50.3, 17.6, 1},
		{"ship_component_weapon_refire_rate", 486, 364, 3},
		{"ship_component_hitpoints", 1002.8, 1333.3, 1},
		{"ship_component_armor", 501.4, 666.7, 1},
		{"ship_component_energy_required", 3406, 1194, 0},
		{"ship_component_mass", 46491, 16299, 0},
		{"reverseengineeringlevel", 8, 8, 0},
	},

	customizationStringName = {},
	customizationValues = {}
}


addLootItemTemplate("wpn_incom_quad_blaster", wpn_incom_quad_blaster)
