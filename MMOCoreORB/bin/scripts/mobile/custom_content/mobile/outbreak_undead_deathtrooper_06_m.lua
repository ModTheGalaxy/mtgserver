outbreak_undead_deathtrooper_06_m = Creature:new {
	customName = "Deathtrooper",
	socialGroup = "",
	faction = "",
	mobType = MOB_NPC,
	level = 50,
	chanceHit = 0.68,
	damageMin = 160,
	damageMax = 290,
	baseXp = 1514,
	baseHAM = 4000,
	baseHAMmax = 5500,
	armor = 1,
	resists = {6, 6, 6, 6, 6, 6, 6, -1, -1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 1,
	pvpBitmask = ATTACKABLE,
	creatureBitmask = NONE,
	optionsBitmask = 128,
	diet = HERBIVORE,
	scale = 1,
	customAiMap = "",

	templates = {
		"object/mobile/outbreak_undead_deathtrooper_06_m.iff"
	},

	lootGroups = {
	},

	-- Primary and secondary weapon should be different types (rifle/carbine, carbine/pistol, rifle/unarmed, etc)
	-- Unarmed should be put on secondary unless the mobile doesn't use weapons, in which case "unarmed" should be put primary and "none" as secondary
	primaryWeapon = "unarmed",
	secondaryWeapon = "none",

	-- primaryAttacks and secondaryAttacks should be separate skill groups specific to the weapon type listed in primaryWeapon and secondaryWeapon
	-- Use merge() to merge groups in creatureskills.lua together. If a weapon is set to "none", set the attacks variable to empty brackets
	primaryAttacks = merge(pistoleermaster,carbineermaster,marksmanmaster,riflemanmaster),
	secondaryAttacks = {},
	conversationTemplate = ""
}

CreatureTemplates:addCreatureTemplate(outbreak_undead_deathtrooper_06_m, "outbreak_undead_deathtrooper_06_m")