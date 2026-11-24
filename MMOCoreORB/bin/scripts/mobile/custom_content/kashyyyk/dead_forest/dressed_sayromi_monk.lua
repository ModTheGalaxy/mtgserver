ep3_forest_sayormi_monk = Creature:new {
	customName = "a sayormi monk",
	socialGroup = "townsperson",
	faction = "townsperson",
	mobType = MOB_NPC,
	level = 40,
	chanceHit = 0.42,
	damageMin = 360,
	damageMax = 430,
	baseXp = 3915,
	baseHAM = 9000,
	baseHAMmax = 11000,
	armor = 0,
	resists = {3, 8, 3, -1, -1, 8, 6, -1, -1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = ATTACKABLE,
	creatureBitmask = NONE,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,
	scale = 1,
	customAiMap = "",

	templates = {
		"object/mobile/dressed_sayromi_monk_01.iff",
		"object/mobile/dressed_sayromi_monk_02.iff",
		"object/mobile/dressed_sayromi_monk_03.iff",
		"object/mobile/dressed_sayromi_monk_04.iff",
		"object/mobile/dressed_sayromi_monk_05.iff",
		"object/mobile/dressed_sayromi_monk_06.iff"
	},

	lootGroups = {
	},

	-- Primary and secondary weapon should be different types (rifle/carbine, carbine/pistol, rifle/unarmed, etc)
	-- Unarmed should be put on secondary unless the mobile doesn't use weapons, in which case "unarmed" should be put primary and "none" as secondary
	primaryWeapon = "unarmed",
	secondaryWeapon = "none",

	-- primaryAttacks and secondaryAttacks should be separate skill groups specific to the weapon type listed in primaryWeapon and secondaryWeapon
	-- Use merge() to merge groups in creatureskills.lua together. If a weapon is set to "none", set the attacks variable to empty brackets
	primaryAttacks = merge(marksmannovice,brawlernovice),
	secondaryAttacks = {},
	conversationTemplate = ""
}

CreatureTemplates:addCreatureTemplate(ep3_forest_sayormi_monk, "ep3_forest_sayormi_monk")