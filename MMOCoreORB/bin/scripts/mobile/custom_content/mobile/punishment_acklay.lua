punishment_acklay = Creature:new {
	objectName = "@mob/creature_names:geonosian_acklay_bunker_boss",
	customName = "Acklay of Atonement",
	socialGroup = "geonosian_creature",
	faction = "",
	mobType = MOB_NPC,
	level = 157,
	chanceHit = 92.5,
	damageMin = 535,
	damageMax = 900,
	baseXp = 14884,
	baseHAM = 20000,
	baseHAMmax = 21000,
	armor = 2,
	resists = {49, 49, 49, 49, 49, 49, 49, 49, -1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 25,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER,
	optionsBitmask = AIENABLED,
	diet = CARNIVORE,
	scale = 3,
	customAiMap = "",

	templates = {
		"object/mobile/acklay_hue.iff"
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
		{"posturedownattack", "stateAccuracyBonus=50"},
		{"creatureareacombo", "stateAccuracyBonus=50"}
	},
	secondaryAttacks = {},
	conversationTemplate = ""
}

CreatureTemplates:addCreatureTemplate(punishment_acklay, "punishment_acklay")