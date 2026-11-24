ep3_etyyy_laen_pieweto = Creature:new {
	customName = "Laen Pieweto, Chiss Poacher Leader",
	socialGroup = "townsperson",
	faction = "",
	mobType = MOB_NPC,
	level = 47,
	chanceHit = 0.47,
	damageMin = 500,
	damageMax = 600,
	baseXp = 4700,
	baseHAM = 20000,
	baseHAMmax = 25000,
	armor = 2,
	resists = {31, 31, 31, 16, 16, 0, 0, -1, -1},
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
		"object/mobile/ep3/ep3_etyyy_laen_pieweto.iff"
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

CreatureTemplates:addCreatureTemplate(ep3_etyyy_laen_pieweto, "ep3_etyyy_laen_pieweto")