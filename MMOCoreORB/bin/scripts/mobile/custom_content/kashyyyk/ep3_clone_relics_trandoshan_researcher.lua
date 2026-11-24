ep3_clone_relics_trandoshan_researcher = Creature:new {
	customName = "Trandoshan Researcher",
	randomNameType = NAME_GENERIC_TAG,
	socialGroup = "trandoshan",
	faction = "",
	mobType = MOB_NPC,
	level = 30,
	chanceHit = 0.33,
	damageMin = 180,
	damageMax = 190,
	baseXp = 1609,
	baseHAM = 4500,
	baseHAMmax = 5500,
	armor = 1,
	resists = {2, 2, 2, 2, 2, 2, 2, -1, -1},
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
		"object/mobile/ep3/ep3_clone_relics_trandoshan_researcher_01.iff",
		"object/mobile/ep3/ep3_clone_relics_trandoshan_researcher_02.iff",
		"object/mobile/ep3/ep3_clone_relics_trandoshan_researcher_03.iff",
		"object/mobile/ep3/ep3_clone_relics_trandoshan_researcher_04.iff",
		"object/mobile/ep3/ep3_clone_relics_trandoshan_researcher_05.iff",
		"object/mobile/ep3/ep3_clone_relics_trandoshan_researcher_06.iff",
		"object/mobile/ep3/ep3_clone_relics_trandoshan_researcher_07.iff",
		"object/mobile/ep3/ep3_clone_relics_trandoshan_researcher_08.iff"
	},

	lootGroups = {
	},

	-- Primary and secondary weapon should be different types (rifle/carbine, carbine/pistol, rifle/unarmed, etc)
	-- Unarmed should be put on secondary unless the mobile doesn't use weapons, in which case "unarmed" should be put primary and "none" as secondary
	primaryWeapon = "blood_razer_weapons",
	secondaryWeapon = "none",

	-- primaryAttacks and secondaryAttacks should be separate skill groups specific to the weapon type listed in primaryWeapon and secondaryWeapon
	-- Use merge() to merge groups in creatureskills.lua together. If a weapon is set to "none", set the attacks variable to empty brackets
	primaryAttacks = merge(brawlermaster,marksmanmaster),
	secondaryAttacks = {},
	conversationTemplate = "",
	reactionStf = "@npc_reaction/slang"
}

CreatureTemplates:addCreatureTemplate(ep3_clone_relics_trandoshan_researcher, "ep3_clone_relics_trandoshan_researcher")