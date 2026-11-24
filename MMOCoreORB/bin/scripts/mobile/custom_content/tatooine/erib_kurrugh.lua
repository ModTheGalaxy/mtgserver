erib_kurrugh = Creature:new {
	customName = "Erib Kurrugh (a Sand Splitter founder)",
	socialGroup = "sand_splitter",
	faction = "sand_splitter",
	mobType = MOB_NPC,
	level = 24,
	chanceHit = 0.55,
	damageMin = 270,
	damageMax = 310,
	baseXp = 2543,
	baseHAM = 6800,
	baseHAMmax = 8300,
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
	creatureBitmask = PACK + KILLER,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,
	scale = 1,
	customAiMap = "",

	templates = {
		"object/mobile/tatooine_sand_splitter_erib_kurrugh.iff"
	},

	lootGroups = {
	},

	-- Primary and secondary weapon should be different types (rifle/carbine, carbine/pistol, rifle/unarmed, etc)
	-- Unarmed should be put on secondary unless the mobile doesn't use weapons, in which case "unarmed" should be put primary and "none" as secondary
	primaryWeapon = "corsec_police_weapons",
	secondaryWeapon = "none",

	-- primaryAttacks and secondaryAttacks should be separate skill groups specific to the weapon type listed in primaryWeapon and secondaryWeapon
	-- Use merge() to merge groups in creatureskills.lua together. If a weapon is set to "none", set the attacks variable to empty brackets
	primaryAttacks = merge(brawlermaster,marksmanmaster),
	secondaryAttacks = {},
	conversationTemplate = "",
	reactionStf = "@npc_reaction/military"
}

CreatureTemplates:addCreatureTemplate(erib_kurrugh, "erib_kurrugh")