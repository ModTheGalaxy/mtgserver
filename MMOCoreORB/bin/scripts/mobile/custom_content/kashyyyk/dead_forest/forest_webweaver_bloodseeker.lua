forest_webweaver_bloodseeker = Creature:new {
	objectName = "@monster_name:webweaver",
	customName = "",
	socialGroup = "webweaver",
	faction = "",
	mobType = MOB_NPC,
	level = 55,
	chanceHit = 0.6,
	damageMin = 445,
	damageMax = 600,
	baseXp = 5373,
	baseHAM = 11000,
	baseHAMmax = 14000,
	armor = 0,
	resists = {-1, 7, -1, 0, 0, 11, 0, -1, -1},
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
	scale = 1.25,
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

CreatureTemplates:addCreatureTemplate(forest_webweaver_bloodseeker, "forest_webweaver_bloodseeker")