spacestation_dathomir = ShipAgent:new {
	template = "spacestation_dathomir",
	shipType = "capital",

	lootChance = 0,
	lootRolls = 0,
	lootTable = "space_civilian_tier1",

	minCredits = 791,
	maxCredits = 1300,

	aggressive = 0,

	spaceFaction = "station",
	appearance = "spacestation",
	tauntAttackChance = 0.1,
	tauntDefendChance = 0.05,
	tauntDieChance = 0.1,

	pvpBitmask = NONE,
	shipBitmask = NONE,
	optionsBitmask = AIENABLED + INVULNERABLE,

	customShipAiMap = "spaceStations",

	conversationTemplate = "spacestation_dathomir_convotemplate",
	conversationMobile = "object/mobile/shared_space_comm_station_dathomir.iff",
	conversationMessage = "@conversation/station_dathomir:s_562", -- Too Far Message
}

ShipAgentTemplates:addShipAgentTemplate(spacestation_dathomir, "spacestation_dathomir")