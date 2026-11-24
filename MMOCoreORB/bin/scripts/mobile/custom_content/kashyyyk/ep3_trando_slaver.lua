ep3_trando_slaver = Creature:new {
	customName = "Trandoshan Slaver",
	randomNameType = NAME_GENERIC_TAG,
	socialGroup = "trandoshan",
	faction = "",
	mobType = MOB_NPC,
	level = 80,
	chanceHit = 1,
	damageMin = 1150,
	damageMax = 1470,
	baseXp = 3500,
	baseHAM = 11000,
	baseHAMmax = 18000,
	armor = 1,
	resists = {4, 4, 5, 5, 7, 5, 7, 5, -1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = AGGRESSIVE + ATTACKABLE,
	creatureBitmask = PACK,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,
	scale = 1,
	customAiMap = "",

	templates = {
		"object/mobile/ep3/ep3_trando_slaver_01.iff",
		"object/mobile/ep3/ep3_trando_slaver_02.iff",
		"object/mobile/ep3/ep3_trando_slaver_03.iff",
		"object/mobile/ep3/ep3_trando_slaver_04.iff",
		"object/mobile/ep3/ep3_trando_slaver_05.iff"
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

CreatureTemplates:addCreatureTemplate(ep3_trando_slaver, "ep3_trando_slaver")