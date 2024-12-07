shd_incom_rayshield_z1 = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/tangible/ship/components/shield_generator/shd_incom_rayshield_z1.iff",
	craftingValues = {
		{"ship_component_shield_recharge_rate", 1.5, 10.3, 1},
		{"ship_component_shield_hitpoints_front", 145.4, 1455, 1},
		{"ship_component_shield_hitpoints_back", 145.4, 1455, 1},
		{"ship_component_hitpoints", 661.8, 988.7, 1},
		{"ship_component_armor", 330.9, 494.4, 1},
		{"ship_component_energy_required", 5187, 518, 0},
		{"ship_component_mass", 13994, 3881, 0},
		{"reverseengineeringlevel", 5, 5, 0},
	},

	customizationStringName = {},
	customizationValues = {}
}


addLootItemTemplate("shd_incom_rayshield_z1", shd_incom_rayshield_z1)
