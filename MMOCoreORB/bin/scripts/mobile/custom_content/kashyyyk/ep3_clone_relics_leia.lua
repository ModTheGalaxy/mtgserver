ep3_clone_relics_leia = Creature:new {
	customName = "Princess Leia",
	socialGroup = "townsperson",
	faction = "",
	mobType = MOB_NPC,
	level = 300,
	chanceHit = 75,
	damageMin = 1800,
	damageMax = 3310,
	baseXp = 278490,
	baseHAM = 421000,
	baseHAMmax = 892000,
	armor = 3,
	resists = {43, 43, 43, 43, 43, 43, 43, 43, 43},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = KILLER + STALKER,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,
	scale = 1,
	customAiMap = "",

	templates = {
		"object/mobile/ep3/ep3_clone_relics_leia.iff"
	},

	lootGroups = {
	},

	-- Primary and secondary weapon should be different types (rifle/carbine, carbine/pistol, rifle/unarmed, etc)
	-- Unarmed should be put on secondary unless the mobile doesn't use weapons, in which case "unarmed" should be put primary and "none" as secondary
	primaryWeapon = "unarmed",
	secondaryWeapon = "none",

	-- primaryAttacks and secondaryAttacks should be separate skill groups specific to the weapon type listed in primaryWeapon and secondaryWeapon
	-- Use merge() to merge groups in creatureskills.lua together. If a weapon is set to "none", set the attacks variable to empty brackets
	primaryAttacks = merge(brawlermaster,marksmanmaster,lightsabermaster),
	secondaryAttacks = {},
	conversationTemplate = ""
}

CreatureTemplates:addCreatureTemplate(ep3_clone_relics_leia, "ep3_clone_relics_leia")