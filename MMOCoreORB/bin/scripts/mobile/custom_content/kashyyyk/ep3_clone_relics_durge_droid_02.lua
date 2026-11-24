ep3_clone_relics_durge_droid_02 = Creature:new {
	customName = "Durge Droid",
	randomNameType = NAME_GENERIC_TAG,
	socialGroup = "droids",
	faction = "",
	mobType = MOB_NPC,
	level = 150,
	chanceHit = 15,
	damageMin = 1750,
	damageMax = 2250,
	baseXp = 15000,
	baseHAM = 275000,
	baseHAMmax = 375000,
	armor = 2,
	resists = {9, 9, 9, 9, 9, 9, 9, 9, 4},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = AGGRESSIVE + ENEMY + ATTACKABLE,
	creatureBitmask = PACK + KILLER,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,
	scale = 1,
	customAiMap = "",

	templates = {
		"object/mobile/ep3/ep3_clone_relics_durge_droid_02.iff"
	},

	lootGroups = {
	},

	-- Primary and secondary weapon should be different types (rifle/carbine, carbine/pistol, rifle/unarmed, etc)
	-- Unarmed should be put on secondary unless the mobile doesn't use weapons, in which case "unarmed" should be put primary and "none" as secondary
	primaryWeapon = "unarmed",
	secondaryWeapon = "none",

	-- primaryAttacks and secondaryAttacks should be separate skill groups specific to the weapon type listed in primaryWeapon and secondaryWeapon
	-- Use merge() to merge groups in creatureskills.lua together. If a weapon is set to "none", set the attacks variable to empty brackets
	primaryAttacks = merge(bountyhuntermaster),
	secondaryAttacks = {},
	conversationTemplate = ""
}

CreatureTemplates:addCreatureTemplate(ep3_clone_relics_durge_droid_02, "ep3_clone_relics_durge_droid_02")