clone_relics_sawtooth = Creature:new {
	customName = "Sawtooth",
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
	resists = {122, 122, 115, 13, -1, 122, 9, 117, -1},
	meatType = "meat_carnivore",
	meatAmount = 1020,
	hideType = "hide_leathery",
	hideAmount = 900,
	boneType = "bone_mammal",
	boneAmount = 850,
	milkType = "",
	milk = 0,
	tamingChance = 0,
	ferocity = 5,
	pvpBitmask = ATTACKABLE,
	creatureBitmask = HERD,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,
	scale = 2.5,
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
		{"stunattack", ""},
		{"knockdownattack", ""}
	},
	secondaryAttacks = {},
	conversationTemplate = ""
}

CreatureTemplates:addCreatureTemplate(clone_relics_sawtooth, "clone_relics_sawtooth")