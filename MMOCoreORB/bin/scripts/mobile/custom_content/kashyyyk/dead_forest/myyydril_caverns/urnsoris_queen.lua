urnsoris_queen = Creature:new {
	objectName = "@monster_name:urnsoris_queen",
	customName = "",
	socialGroup = "urnsoris",
	faction = "",
	mobType = MOB_HERBIVORE,
	level = 95,
	chanceHit = 1.5,
	damageMin = 625,
	damageMax = 950,
	baseXp = 9057,
	baseHAM = 75000,
	baseHAMmax = 95000,
	armor = 2,
	resists = {138, 138, 135, 130, 135, 138, 154, 135, -1},
	meatType = "meat_carnivore",
	meatAmount = 200,
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
	scale = 1.8,
	customAiMap = "",

	templates = {
		"object/mobile/urnsoris_queen.iff"
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
		{"strongdisease", ""},
		{"creatureareacombo", ""}
	},
	secondaryAttacks = {},
	conversationTemplate = ""
}

CreatureTemplates:addCreatureTemplate(urnsoris_queen, "urnsoris_queen")