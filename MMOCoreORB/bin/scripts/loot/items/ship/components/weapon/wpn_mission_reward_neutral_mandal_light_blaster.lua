wpn_mission_reward_neutral_mandal_light_blaster = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "",
	directObjectTemplate = "object/tangible/ship/components/weapon/wpn_mission_reward_neutral_mandal_light_blaster.iff",
	craftingValues = {
		{"ship_component_weapon_damage_minimum", 348, 348, 1},
		{"ship_component_weapon_damage_maximum", 468, 468, 1},
		{"ship_component_weapon_effectiveness_shields", 500, 500, 3},
		{"ship_component_weapon_effectiveness_armor", 500, 500, 3},
		{"ship_component_weapon_energy_per_shot", 20.4, 20.4, 1},
		{"ship_component_weapon_refire_rate", 340, 340, 3},
		{"ship_component_hitpoints", 180, 180, 1},
		{"ship_component_armor", 90, 90, 1},
		{"ship_component_energy_required", 2400, 2400, 0},
		{"ship_component_mass", 1200, 1200, 0},
		{"reverseengineeringlevel", 1, 1, 0},
	},

	customizationStringName = {},
	customizationValues = {}
}


addLootItemTemplate("wpn_mission_reward_neutral_mandal_light_blaster", wpn_mission_reward_neutral_mandal_light_blaster)
