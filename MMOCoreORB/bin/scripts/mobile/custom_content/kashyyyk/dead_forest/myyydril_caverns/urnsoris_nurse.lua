urnsoris_nurse = Creature:new {
	objectName = "@monster_name:urnsoris_nurse",
	customName = "",
	socialGroup = "urnsoris",
	faction = "",
	mobType = MOB_HERBIVORE,
	level = 75,
	chanceHit = 1,
	damageMin = 625,
	damageMax = 775,
	baseXp = 7207,
	baseHAM = 16500,
	baseHAMmax = 19000,
	armor = 1,
	resists = {130, 132, 130, 17, 125, 120, 145, 125, -1},
	meatType = "meat_carnivore",
	meatAmount = 30,
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
		"object/mobile/urnsoris_nurse.iff"
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
		{"intimidationattack", ""}
	},
	secondaryAttacks = {},
	conversationTemplate = ""
}

CreatureTemplates:addCreatureTemplate(urnsoris_nurse, "urnsoris_nurse")