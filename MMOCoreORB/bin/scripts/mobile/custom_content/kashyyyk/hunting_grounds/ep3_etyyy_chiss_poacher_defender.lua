ep3_etyyy_chiss_poacher_defender = Creature:new {
	customName = "a chiss poacher defender",
	socialGroup = "",
	faction = "",
	mobType = MOB_NPC,
	level = 45,
	chanceHit = 0.45,
	damageMin = 300,
	damageMax = 550,
	baseXp = 1609,
	baseHAM = 8000,
	baseHAMmax = 9000,
	armor = 1,
	resists = {9, 9, 2, 2, 2, 2, 2, -1, -1},
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
		"object/mobile/ep3/ep3_etyyy_chiss_poacher_defender_01.iff",
		"object/mobile/ep3/ep3_etyyy_chiss_poacher_defender_02.iff",
		"object/mobile/ep3/ep3_etyyy_chiss_poacher_defender_03.iff",
		"object/mobile/ep3/ep3_etyyy_chiss_poacher_defender_04.iff"
	},

	lootGroups = {
	},

	-- Primary and secondary weapon should be different types (rifle/carbine, carbine/pistol, rifle/unarmed, etc)
	-- Unarmed should be put on secondary unless the mobile doesn't use weapons, in which case "unarmed" should be put primary and "none" as secondary
	primaryWeapon = "pirate_weapons_heavy",
	secondaryWeapon = "none",

	-- primaryAttacks and secondaryAttacks should be separate skill groups specific to the weapon type listed in primaryWeapon and secondaryWeapon
	-- Use merge() to merge groups in creatureskills.lua together. If a weapon is set to "none", set the attacks variable to empty brackets
	primaryAttacks = merge(brawlermaster,marksmanmaster),
	secondaryAttacks = {},
	conversationTemplate = "",
	reactionStf = "@npc_reaction/slang"
}

CreatureTemplates:addCreatureTemplate(ep3_etyyy_chiss_poacher_defender, "ep3_etyyy_chiss_poacher_defender")