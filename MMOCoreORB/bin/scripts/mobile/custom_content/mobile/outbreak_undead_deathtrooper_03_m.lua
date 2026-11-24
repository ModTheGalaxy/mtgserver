outbreak_undead_deathtrooper_03_m = Creature:new {
	customName = "Deathtrooper",
	socialGroup = "",
	faction = "",
	mobType = MOB_NPC,
	level = 150,
	chanceHit = 5,
	damageMin = 400,
	damageMax = 990,
	baseXp = 11514,
	baseHAM = 14000,
	baseHAMmax = 15500,
	armor = 1,
	resists = {11, 11, 11, 11, 11, 11, 11, -1, -1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 1,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = KILLER,
	optionsBitmask = 128,
	diet = HERBIVORE,
	scale = 1,
	customAiMap = "",

	templates = {
		"object/mobile/outbreak_undead_deathtrooper_03_m.iff"
	},

	lootGroups = {
		{
			groups = {
				{group = "clothing_attachments", chance = 4500000},
				{group = "armor_attachments", chance = 2000000},
				{group = "nyms_common", chance = 1000000},
				{group = "pistols", chance = 1000000},
				{group = "carbines", chance = 1000000},
				{group = "tailor_components", chance = 500000}
			},
			lootChance = 9000000
		}
	},

	-- Primary and secondary weapon should be different types (rifle/carbine, carbine/pistol, rifle/unarmed, etc)
	-- Unarmed should be put on secondary unless the mobile doesn't use weapons, in which case "unarmed" should be put primary and "none" as secondary
	primaryWeapon = "unarmed",
	secondaryWeapon = "none",

	-- primaryAttacks and secondaryAttacks should be separate skill groups specific to the weapon type listed in primaryWeapon and secondaryWeapon
	-- Use merge() to merge groups in creatureskills.lua together. If a weapon is set to "none", set the attacks variable to empty brackets
	primaryAttacks = merge(pistoleermaster,carbineermaster,marksmanmaster,riflemanmaster),
	secondaryAttacks = {},
	conversationTemplate = ""
}

CreatureTemplates:addCreatureTemplate(outbreak_undead_deathtrooper_03_m, "outbreak_undead_deathtrooper_03_m")