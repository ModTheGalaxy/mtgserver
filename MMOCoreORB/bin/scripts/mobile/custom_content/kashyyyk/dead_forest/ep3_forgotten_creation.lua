ep3_forgotten_creation = Creature:new {
	customName = "a forgotten creation",
	socialGroup = "thug",
	faction = "thug",
	mobType = MOB_NPC,
	level = 7,
	chanceHit = 0.46,
	damageMin = 65,
	damageMax = 80,
	baseXp = 250,
	baseHAM = 290,
	baseHAMmax = 390,
	armor = 0,
	resists = {5, 5, 5, 5, 5, 5, 5, -1, -1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = NONE,
	creatureBitmask = PACK,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,
	scale = 1,
	customAiMap = "",

	templates = {
		"object/mobile/battle_droid.iff",
		"object/mobile/droideka.iff",
		"object/mobile/blastromech.iff",
		"object/mobile/le_repair_droid.iff",
		"object/mobile/dz70_fugitive_tracker_droid.iff"
	},

	lootGroups = {
	},

	-- Primary and secondary weapon should be different types (rifle/carbine, carbine/pistol, rifle/unarmed, etc)
	-- Unarmed should be put on secondary unless the mobile doesn't use weapons, in which case "unarmed" should be put primary and "none" as secondary
	primaryWeapon = "battle_droid_weapons",
	secondaryWeapon = "none",

	-- primaryAttacks and secondaryAttacks should be separate skill groups specific to the weapon type listed in primaryWeapon and secondaryWeapon
	-- Use merge() to merge groups in creatureskills.lua together. If a weapon is set to "none", set the attacks variable to empty brackets
	primaryAttacks = merge(marksmannovice,brawlernovice),
	secondaryAttacks = {},
	conversationTemplate = ""
}

CreatureTemplates:addCreatureTemplate(ep3_forgotten_creation, "ep3_forgotten_creation")