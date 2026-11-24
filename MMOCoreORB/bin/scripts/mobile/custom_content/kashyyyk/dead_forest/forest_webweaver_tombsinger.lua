forest_webweaver_tombsinger = Creature:new {
	customName = "a Forest Webweaver gravespinner",
	socialGroup = "webweaver",
	faction = "",
	mobType = MOB_NPC,
	level = 57,
	chanceHit = 0.55,
	damageMin = 450,
	damageMax = 610,
	baseXp = 5555,
	baseHAM = 11000,
	baseHAMmax = 14000,
	armor = 1,
	resists = {102, 102, 102, 108, 8, -1, -1, 2, -1},
	meatType = "meat_insect",
	meatAmount = 18,
	hideType = "hide_bristley",
	hideAmount = 21,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 3,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,
	scale = 1.35,
	customAiMap = "",

	templates = {
		"object/mobile/webweaver.iff"
	},

	lootGroups = {
	},

	-- Primary and secondary weapon should be different types (rifle/carbine, carbine/pistol, rifle/unarmed, etc)
	-- Unarmed should be put on secondary unless the mobile doesn't use weapons, in which case "unarmed" should be put primary and "none" as secondary
	primaryWeapon = "unarmed",
	secondaryWeapon = "none",

	-- primaryAttacks and secondaryAttacks should be separate skill groups specific to the weapon type listed in primaryWeapon and secondaryWeapon
	-- Use merge() to merge groups in creatureskills.lua together. If a weapon is set to "none", set the attacks variable to empty brackets
	primaryAttacks = {
		{"intimidationattack", "stateAccuracyBonus=25"},
		{"blindattack", "stateAccuracyBonus=25"}
	},
	secondaryAttacks = {},
	conversationTemplate = ""
}

CreatureTemplates:addCreatureTemplate(forest_webweaver_tombsinger, "forest_webweaver_tombsinger")