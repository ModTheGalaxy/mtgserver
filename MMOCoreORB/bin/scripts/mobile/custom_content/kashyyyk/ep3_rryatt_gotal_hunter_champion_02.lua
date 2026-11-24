ep3_rryatt_gotal_hunter_champion_02 = Creature:new {
	customName = "Gotal Hunter Champion",
	randomNameType = NAME_GENERIC_TAG,
	socialGroup = "townsperson",
	faction = "",
	mobType = MOB_NPC,
	level = 115,
	chanceHit = 3.85,
	damageMin = 1800,
	damageMax = 2400,
	baseXp = 8500,
	baseHAM = 85000,
	baseHAMmax = 105000,
	armor = 3,
	resists = {33, 33, 33, 33, 33, 33, 33, 33, -1},
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
		"object/mobile/ep3/ep3_rryatt_gotal_hunter_champion_02.iff"
	},

	lootGroups = {
	},

	-- Primary and secondary weapon should be different types (rifle/carbine, carbine/pistol, rifle/unarmed, etc)
	-- Unarmed should be put on secondary unless the mobile doesn't use weapons, in which case "unarmed" should be put primary and "none" as secondary
	primaryWeapon = "pirate_weapons_heavy",
	secondaryWeapon = "none",

	-- primaryAttacks and secondaryAttacks should be separate skill groups specific to the weapon type listed in primaryWeapon and secondaryWeapon
	-- Use merge() to merge groups in creatureskills.lua together. If a weapon is set to "none", set the attacks variable to empty brackets
	primaryAttacks = merge(brawlermaster,marksmanmaster),
	secondaryAttacks = {},
	conversationTemplate = "",
	reactionStf = "@npc_reaction/slang"
}

CreatureTemplates:addCreatureTemplate(ep3_rryatt_gotal_hunter_champion_02, "ep3_rryatt_gotal_hunter_champion_02")