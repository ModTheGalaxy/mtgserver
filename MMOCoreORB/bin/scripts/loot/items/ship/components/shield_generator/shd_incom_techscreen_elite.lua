shd_incom_techscreen_elite = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/tangible/ship/components/shield_generator/shd_incom_techscreen_elite.iff",
	craftingValues = {
		{"ship_component_shield_recharge_rate", 3.6, 24.2, 1},
		{"ship_component_shield_hitpoints_front", 360.2, 3602.9, 1},
		{"ship_component_shield_hitpoints_back", 360.2, 3602.9, 1},
		{"ship_component_hitpoints", 1258.7, 1492.2, 1},
		{"ship_component_armor", 629.3, 746.1, 1},
		{"ship_component_energy_required", 5650, 564, 0},
		{"ship_component_mass", 113325, 31435, 0},
		{"reverseengineeringlevel", 10, 10, 0},
	},

	customizationStringName = {},
	customizationValues = {}
}


addLootItemTemplate("shd_incom_techscreen_elite", shd_incom_techscreen_elite)
