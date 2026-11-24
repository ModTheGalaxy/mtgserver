ep3_etyyy_uller_spiketop = Creature:new {
	customName = "Spiketop",
	socialGroup = "uller",
	faction = "",
	mobType = MOB_HERBIVORE,
	level = 65,
	chanceHit = 1,
	damageMin = 500,
	damageMax = 700,
	baseXp = 6500,
	baseHAM = 13000,
	baseHAMmax = 14500,
	armor = 1,
	resists = {118, 118, 112, 11, -1, 118, 7, 114, -1},
	meatType = "meat_herbivore",
	meatAmount = 18,
	hideType = "hide_wooly",
	hideAmount = 21,
	boneType = "bone_horn",
	boneAmount = 23,
	milkType = "",
	milk = 0,
	tamingChance = 0,
	ferocity = 5,
	pvpBitmask = ATTACKABLE,
	creatureBitmask = HERD,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,
	scale = 1,
	customAiMap = "",

	templates = {
		"object/mobile/uller.iff"
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
		{"creatureareaknockdown", ""},
		{"intimidationattack", ""}
	},
	secondaryAttacks = {},
	conversationTemplate = ""
}

CreatureTemplates:addCreatureTemplate(ep3_etyyy_uller_spiketop, "ep3_etyyy_uller_spiketop")