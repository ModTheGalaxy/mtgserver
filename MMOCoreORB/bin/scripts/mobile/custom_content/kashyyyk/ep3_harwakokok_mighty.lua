ep3_harwakokok_mighty = Creature:new {
	customName = "Harwakokok The Mighty",
	socialGroup = "wookiee",
	faction = "",
	mobType = MOB_NPC,
	level = 250,
	chanceHit = 25,
	damageMin = 2250,
	damageMax = 3470,
	baseXp = 25000,
	baseHAM = 400000,
	baseHAMmax = 500000,
	armor = 3,
	resists = {85, 85, 85, 85, 85, 85, 85, 85, -1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = NONE,
	creatureBitmask = NONE,
	optionsBitmask = AIENABLED + INVULNERABLE,
	diet = HERBIVORE,
	scale = 1.3,
	customAiMap = "",

	templates = {
		"object/mobile/ep3/ep3_harwakokok_mighty.iff"
	},

	lootGroups = {
	},

	-- Primary and secondary weapon should be different types (rifle/carbine, carbine/pistol, rifle/unarmed, etc)
	-- Unarmed should be put on secondary unless the mobile doesn't use weapons, in which case "unarmed" should be put primary and "none" as secondary
	primaryWeapon = "chewbacca_weapons",
	secondaryWeapon = "none",

	-- primaryAttacks and secondaryAttacks should be separate skill groups specific to the weapon type listed in primaryWeapon and secondaryWeapon
	-- Use merge() to merge groups in creatureskills.lua together. If a weapon is set to "none", set the attacks variable to empty brackets
	primaryAttacks = merge(brawlermaster,marksmanmaster),
	secondaryAttacks = {},
	conversationTemplate = ""
}

CreatureTemplates:addCreatureTemplate(ep3_harwakokok_mighty, "ep3_harwakokok_mighty")