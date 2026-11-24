ep3_forest_steelclaw = Creature:new {
	customName = "Steelclaw",
	socialGroup = "mouf",
	faction = "",
	mobType = MOB_HERBIVORE,
	level = 30,
	chanceHit = 1,
	damageMin = 250,
	damageMax = 300,
	baseXp = 3000,
	baseHAM = 7500,
	baseHAMmax = 7900,
	armor = 0,
	resists = {108, 108, -1, -1, 115, 5, 5, -1, -1},
	meatType = "meat_wild",
	meatAmount = 90,
	hideType = "hide_wooly",
	hideAmount = 60,
	boneType = "bone_mammal",
	boneAmount = 50,
	milkType = "",
	milk = 0,
	tamingChance = 0.25,
	ferocity = 0,
	pvpBitmask = ATTACKABLE,
	creatureBitmask = HERD,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,
	scale = 1.5,
	customAiMap = "",

	templates = {
		"object/mobile/mouf.iff"
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
		{"stunattack", ""},
		{"knockdownattack", ""}
	},
	secondaryAttacks = {},
	conversationTemplate = ""
}

CreatureTemplates:addCreatureTemplate(ep3_forest_steelclaw, "ep3_forest_steelclaw")