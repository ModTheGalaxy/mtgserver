urnsoris_handmaiden = Creature:new {
	objectName = "@monster_name:urnsoris_handmaiden",
	customName = "",
	socialGroup = "urnsoris",
	faction = "",
	mobType = MOB_HERBIVORE,
	level = 80,
	chanceHit = 1,
	damageMin = 625,
	damageMax = 825,
	baseXp = 7668,
	baseHAM = 19000,
	baseHAMmax = 23000,
	armor = 1,
	resists = {136, 133, 133, 126, 133, 128, 152, 131, -1},
	meatType = "meat_carnivore",
	meatAmount = 100,
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
	scale = 1.5,
	customAiMap = "",

	templates = {
		"object/mobile/urnsoris_handmaiden.iff"
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
		{"creatureareaknockdown", ""}
	},
	secondaryAttacks = {},
	conversationTemplate = ""
}

CreatureTemplates:addCreatureTemplate(urnsoris_handmaiden, "urnsoris_handmaiden")