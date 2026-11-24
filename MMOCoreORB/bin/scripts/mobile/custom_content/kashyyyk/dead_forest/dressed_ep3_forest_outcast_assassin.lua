dressed_ep3_forest_outcast_assassin = Creature:new {
	customName = "a Forest Outcast assissin",
	socialGroup = "webweaver",
	faction = "",
	mobType = MOB_NPC,
	level = 40,
	chanceHit = 0.42,
	damageMin = 360,
	damageMax = 430,
	baseXp = 3915,
	baseHAM = 9000,
	baseHAMmax = 11000,
	armor = 0,
	resists = {7, 16, 7, -1, -1, 16, 13, -1, -1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = ATTACKABLE,
	creatureBitmask = NONE,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,
	scale = 1,
	customAiMap = "",

	templates = {
		"object/mobile/dressed_ep3_forest_outcast_assassin_01.iff",
		"object/mobile/dressed_ep3_forest_outcast_assassin_02.iff"
	},

	lootGroups = {
	},

	-- Primary and secondary weapon should be different types (rifle/carbine, carbine/pistol, rifle/unarmed, etc)
	-- Unarmed should be put on secondary unless the mobile doesn't use weapons, in which case "unarmed" should be put primary and "none" as secondary
	primaryWeapon = "pirate_weapons_light",
	secondaryWeapon = "none",

	-- primaryAttacks and secondaryAttacks should be separate skill groups specific to the weapon type listed in primaryWeapon and secondaryWeapon
	-- Use merge() to merge groups in creatureskills.lua together. If a weapon is set to "none", set the attacks variable to empty brackets
	primaryAttacks = merge(marksmanmaster,brawlermaster),
	secondaryAttacks = {},
	conversationTemplate = "",
	reactionStf = "@npc_reaction/slang"
}

CreatureTemplates:addCreatureTemplate(dressed_ep3_forest_outcast_assassin, "dressed_ep3_forest_outcast_assassin")