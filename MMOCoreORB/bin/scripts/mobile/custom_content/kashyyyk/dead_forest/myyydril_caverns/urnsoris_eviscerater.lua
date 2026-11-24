urnsoris_eviscerater = Creature:new {
	customName = "an urnsoris eviscerater",
	socialGroup = "urnsoris",
	faction = "",
	mobType = MOB_HERBIVORE,
	level = 80,
	chanceHit = 1,
	damageMin = 625,
	damageMax = 825,
	baseXp = 7668,
	baseHAM = 17500,
	baseHAMmax = 21500,
	armor = 1,
	resists = {130, 133, 130, 18, 125, 10, 141, 123, -1},
	meatType = "meat_carnivore",
	meatAmount = 80,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milkType = "",
	milk = 0,
	tamingChance = 0,
	ferocity = 12,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,
	scale = 1.7,
	customAiMap = "",

	templates = {
		"object/mobile/urnsoris.iff"
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
		{"strongpoison", ""},
		{"creatureareableeding", ""}
	},
	secondaryAttacks = {},
	conversationTemplate = ""
}

CreatureTemplates:addCreatureTemplate(urnsoris_eviscerater, "urnsoris_eviscerater")