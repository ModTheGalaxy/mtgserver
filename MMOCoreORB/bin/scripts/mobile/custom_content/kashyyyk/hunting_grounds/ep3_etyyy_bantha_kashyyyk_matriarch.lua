ep3_etyyy_bantha_kashyyyk_matriarch = Creature:new {
	customName = "a bantha matriarch",
	socialGroup = "etyyybantha",
	faction = "",
	mobType = MOB_HERBIVORE,
	level = 38,
	chanceHit = 1,
	damageMin = 380,
	damageMax = 420,
	baseXp = 1900,
	baseHAM = 6000,
	baseHAMmax = 6500,
	armor = 0,
	resists = {105, 1, 107, 1, -1, -1, -1, -1, -1},
	meatType = "meat_herbivore",
	meatAmount = 18,
	hideType = "hide_wooly",
	hideAmount = 21,
	boneType = "bone_horn",
	boneAmount = 23,
	milkType = "",
	milk = 0,
	tamingChance = 0.25,
	ferocity = 0,
	pvpBitmask = ATTACKABLE,
	creatureBitmask = PACK,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,
	scale = 1.1,
	customAiMap = "",

	templates = {
		"object/mobile/kashyyyk_bantha.iff"
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
		{"posturedownattack", ""}
	},
	secondaryAttacks = {},
	conversationTemplate = ""
}

CreatureTemplates:addCreatureTemplate(ep3_etyyy_bantha_kashyyyk_matriarch, "ep3_etyyy_bantha_kashyyyk_matriarch")