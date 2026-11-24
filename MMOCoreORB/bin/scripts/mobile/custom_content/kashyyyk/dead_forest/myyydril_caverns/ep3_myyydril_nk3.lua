ep3_myyydril_nk3 = Creature:new {
	customName = "NK-3",
	socialGroup = "myyydril_grievous",
	faction = "",
	mobType = MOB_NPC,
	level = 260,
	chanceHit = 19,
	damageMin = 1245,
	damageMax = 2400,
	baseXp = 16884,
	baseHAM = 365000,
	baseHAMmax = 385000,
	armor = 2,
	resists = {39, 39, 39, 39, 39, 39, 39, 39, 39},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER + STALKER,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,
	scale = 1.2,
	customAiMap = "",

	templates = {
		"object/mobile/ep3_myyydril_nk3.iff"
	},

	lootGroups = {
	},

	-- Primary and secondary weapon should be different types (rifle/carbine, carbine/pistol, rifle/unarmed, etc)
	-- Unarmed should be put on secondary unless the mobile doesn't use weapons, in which case "unarmed" should be put primary and "none" as secondary
	primaryWeapon = "nk3_weapons",
	secondaryWeapon = "none",

	-- primaryAttacks and secondaryAttacks should be separate skill groups specific to the weapon type listed in primaryWeapon and secondaryWeapon
	-- Use merge() to merge groups in creatureskills.lua together. If a weapon is set to "none" set the attacks variable to empty brackets
	primaryAttacks = {
	},
	secondaryAttacks = {},
	conversationTemplate = ""
}

CreatureTemplates:addCreatureTemplate(ep3_myyydril_nk3, "ep3_myyydril_nk3")