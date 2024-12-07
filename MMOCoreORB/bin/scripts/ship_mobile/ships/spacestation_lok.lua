spacestation_lok = ShipAgent:new {
	template = "spacestation_lok",
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

	conversationTemplate = "spacestation_lok_convotemplate",
	conversationMobile = "object/mobile/shared_space_comm_station_lok.iff",
	conversationMessage = "@conversation/station_lok:s_5d8ae855", -- Too Far Message
}

ShipAgentTemplates:addShipAgentTemplate(spacestation_lok, "spacestation_lok")