urnsoris = Creature:new {
	objectName = "@monster_name:urnsoris",
	customName = "",
	socialGroup = "urnsoris",
	faction = "",
	mobType = MOB_HERBIVORE,
	level = 75,
	chanceHit = 1,
	damageMin = 600,
	damageMax = 750,
	baseXp = 7500,
	baseHAM = 16000,
	baseHAMmax = 17500,
	armor = 1,
	resists = {131, 133, 131, 18, 126, 10, 141, 123, -1},
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
	scale = 1,
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
		{"stunattack", ""}
	},
	secondaryAttacks = {},
	conversationTemplate = ""
}

CreatureTemplates:addCreatureTemplate(urnsoris, "urnsoris")