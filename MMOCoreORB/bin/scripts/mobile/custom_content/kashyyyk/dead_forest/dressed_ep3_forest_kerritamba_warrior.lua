ep3_forest_kerritamba_warrior = Creature:new {
	customName = "a kerritamba warrior",
	socialGroup = "townsperson",
	faction = "townsperson",
	mobType = MOB_NPC,
	level = 45,
	chanceHit = 0.47,
	damageMin = 370,
	damageMax = 450,
	baseXp = 4461,
	baseHAM = 9700,
	baseHAMmax = 11900,
	armor = 1,
	resists = {7, 7, 7, 7, 7, 7, 7, 7, -1},
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
	creatureBitmask = PACK,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,
	scale = 1.3,
	customAiMap = "",

	templates = {
		"object/mobile/dressed_ep3_forest_kerritamba_warrior_01.iff",
		"object/mobile/dressed_ep3_forest_kerritamba_warrior_02.iff",
		"object/mobile/dressed_ep3_forest_kerritamba_warrior_03.iff",
		"object/mobile/dressed_ep3_forest_kerritamba_warrior_04.iff",
		"object/mobile/dressed_ep3_forest_kerritamba_warrior_05.iff",
		"object/mobile/dressed_ep3_forest_kerritamba_warrior_06.iff",
		"object/mobile/dressed_ep3_forest_kerritamba_warrior_07.iff",
		"object/mobile/dressed_ep3_forest_kerritamba_warrior_08.iff"
	},

	lootGroups = {
	},

	-- Primary and secondary weapon should be different types (rifle/carbine, carbine/pistol, rifle/unarmed, etc)
	-- Unarmed should be put on secondary unless the mobile doesn't use weapons, in which case "unarmed" should be put primary and "none" as secondary
	primaryWeapon = "wookiee_weapons",
	secondaryWeapon = "none",

	-- primaryAttacks and secondaryAttacks should be separate skill groups specific to the weapon type listed in primaryWeapon and secondaryWeapon
	-- Use merge() to merge groups in creatureskills.lua together. If a weapon is set to "none", set the attacks variable to empty brackets
	primaryAttacks = merge(riflemanmaster,brawlermaster),
	secondaryAttacks = {},
	conversationTemplate = ""
}

CreatureTemplates:addCreatureTemplate(ep3_forest_kerritamba_warrior, "ep3_forest_kerritamba_warrior")