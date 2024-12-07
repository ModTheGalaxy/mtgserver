spacestation_rebel = ShipAgent:new {
	template = "spacestation_rebel",
	shipType = "capital",

	lootChance = 0,
	lootRolls = 0,
	lootTable = "space_rebel_tier1",

	minCredits = 791,
	maxCredits = 1300,

	aggressive = 0,

	spaceFaction = "rebel",
	imperialFactionReward = 200,
	rebelFactionReward = -500,
	appearance = "rebel_officer",
	tauntAttackChance = 0.1,
	tauntDefendChance = 0.05,
	tauntDieChance = 0.1,

	pvpBitmask = NONE,
	shipBitmask = NONE,
	optionsBitmask = AIENABLED + INVULNERABLE,

	customShipAiMap = "spaceStations",

	conversationTemplate = "",
	conversationMobile = "",
	conversationMessage = "", -- Too Far Message
}

ShipAgentTemplates:addShipAgentTemplate(spacestation_rebel, "spacestation_rebel")
