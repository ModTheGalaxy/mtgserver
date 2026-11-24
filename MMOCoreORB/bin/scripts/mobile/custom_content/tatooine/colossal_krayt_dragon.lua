colossal_krayt_dragon = Creature:new {
	customName = "the Scourge of Tatooine (a colossal krayt dragon)",
	socialGroup = "krayt",
	faction = "",
	mobType = MOB_CARNIVORE,
	level = 336,
	chanceHit = 30.0,
	damageMin = 2270,
	damageMax = 4250,
	baseXp = 32549,
	baseHAM = 410000,
	baseHAMmax = 501000,
	armor = 3,
	resists = {159, 159, 159, 159, 140, 159, 159, 159, -1},
	meatType = "meat_carnivore",
	meatAmount = 1700,
	hideType = "hide_bristley",
	hideAmount = 950,
	boneType = "bone_mammal",
	boneAmount = 905,
	milk = 0,
	tamingChance = 0,
	ferocity = 30,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER + STALKER,
	optionsBitmask = AIENABLED,
	diet = CARNIVORE,
	scale = 2.35,
	customAiMap = "",

	templates = {
		"object/mobile/krayt_dragon_hue.iff"
	},
	hues = { 16, 17, 18, 19, 20, 21, 22, 23 },

	lootGroups = {
	},

	-- Primary and secondary weapon should be different types (rifle/carbine, carbine/pistol, rifle/unarmed, etc)
	-- Unarmed should be put on secondary unless the mobile doesn't use weapons, in which case "unarmed" should be put primary and "none" as secondary
	primaryWeapon = "unarmed",
	secondaryWeapon = "none",

	-- primaryAttacks and secondaryAttacks should be separate skill groups specific to the weapon type listed in primaryWeapon and secondaryWeapon
	-- Use merge() to merge groups in creatureskills.lua together. If a weapon is set to "none", set the attacks variable to empty brackets
	primaryAttacks = { {"creatureareacombo","stateAccuracyBonus=100"}, {"creatureareaknockdown","stateAccuracyBonus=100"} },
	secondaryAttacks = {},
	conversationTemplate = ""
}

CreatureTemplates:addCreatureTemplate(colossal_krayt_dragon, "colossal_krayt_dragon")