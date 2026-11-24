me_sewer_worrt = Creature:new {
	objectName = "@mob/creature_names:me_sewer_worrt",
	customName = "",
	socialGroup = "worrt",
	faction = "",
	mobType = MOB_CARNIVORE,
	level = 16,
	chanceHit = 0.33,
	damageMin = 160,
	damageMax = 170,
	baseXp = 960,
	baseHAM = 2900,
	baseHAMmax = 3500,
	armor = 0,
	resists = {0, 0, 0, 0, 0, 107, 0, -1, -1},
	meatType = "meat_reptilian",
	meatAmount = 3,
	hideType = "hide_leathery",
	hideAmount = 3,
	boneType = "bone_mammal",
	boneAmount = 1,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK,
	optionsBitmask = AIENABLED,
	diet = CARNIVORE,
	scale = 4.5,
	customAiMap = "",

	templates = {
		"object/mobile/worrt.iff"
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
		{"stunattack", ""}
	},
	secondaryAttacks = {},
	conversationTemplate = ""
}

CreatureTemplates:addCreatureTemplate(me_sewer_worrt, "me_sewer_worrt")