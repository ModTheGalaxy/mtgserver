spacestation_talus = ShipAgent:new {
	template = "spacestation_talus",
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

	conversationTemplate = "spacestation_talus_convotemplate",
	conversationMobile = "object/mobile/shared_space_comm_station_talus.iff",
	conversationMessage = "@conversation/station_talus:s_3a99c5fa", -- Too Far Message
}
ShipAgentTemplates:addShipAgentTemplate(spacestation_talus, "spacestation_talus")