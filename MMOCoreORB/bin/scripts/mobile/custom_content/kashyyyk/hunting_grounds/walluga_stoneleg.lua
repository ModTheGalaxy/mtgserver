walluga_stoneleg = Creature:new {
	customName = "Stoneleg",
	socialGroup = "walluga",
	faction = "",
	mobType = MOB_NPC,
	level = 70,
	chanceHit = 0.7,
	damageMin = 495,
	damageMax = 700,
	baseXp = 6655,
	baseHAM = 12000,
	baseHAMmax = 15000,
	armor = 2,
	resists = {10, 18, -1, 18, 18, 41, 18, -1, -1},
	meatType = "meat_herbivore",
	meatAmount = 18,
	hideType = "hide_bristley",
	hideAmount = 21,
	boneType = "bone_mammal",
	boneAmount = 23,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = ATTACKABLE,
	creatureBitmask = PACK + HERD,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,
	scale = 1.9,
	customAiMap = "",

	templates = {
		"object/mobile/walluga.iff"
	},

	lootGroups = {
	},

	-- Primary and secondary weapon should be different types (rifle/carbine, carbine/pistol, rifle/unarmed, etc)
	-- Unarmed should be put on secondary unless the mobile doesn't use weapons, in which case "unarmed" should be put primary and "none" as secondary
	primaryWeapon = "unarmed",
	secondaryWeapon = "none",

	-- primaryAttacks and secondaryAttacks should be separate skill groups specific to the weapon type listed in primaryWeapon and secondaryWeapon
	-- Use merge() to merge groups in creatureskills.lua together. If a weapon is set to "none", set the attacks variable to empty brackets
	primaryAttacks = {},
	secondaryAttacks = {},
	conversationTemplate = ""
}

CreatureTemplates:addCreatureTemplate(walluga_stoneleg, "walluga_stoneleg")