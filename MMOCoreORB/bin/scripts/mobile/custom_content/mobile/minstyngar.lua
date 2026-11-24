minstyngar = Creature:new {
	customName = "Minstyngar",
	socialGroup = "townsperson",
	faction = "",
	mobType = MOB_CARNIVORE,
	level = 400,
	chanceHit = 500,
	damageMin = 1800,
	damageMax = 3600,
	baseXp = 79336,
	baseHAM = 2050000,
	baseHAMmax = 2200000,
	armor = 3,
	resists = {7, 5, 7, 8, 6, 5, 6, 7, 6},
	meatType = "meat_carnivore",
	meatAmount = 18,
	hideType = "hide_leathery",
	hideAmount = 21,
	boneType = "bone_horn",
	boneAmount = 23,
	milk = 0,
	tamingChance = 0,
	ferocity = 30,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER,
	optionsBitmask = 128,
	diet = CARNIVORE,
	scale = 1,
	customAiMap = "",

	templates = {
		"object/mobile/minstyngar.iff"
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
		{"creatureareaknockdown", "knockdownChance=90"},
		{"creatureareadisease", "stateAccuracyBonus=100"},
		{"dizzyattack", "stateAccuracyBonus=100"},
		{"strongpoison", "stateAccuracyBonus=100"},
		{"creatureareapoison", "stateAccuracyBonus=100"}
	},
	secondaryAttacks = {},
	conversationTemplate = ""
}

CreatureTemplates:addCreatureTemplate(minstyngar, "minstyngar")