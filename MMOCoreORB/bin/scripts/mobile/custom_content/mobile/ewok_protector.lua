ewok_protector = Creature:new {
	objectName = "",
	customName = "An Ewok Protector",
	socialGroup = "Dark Jedi",
	faction = "",
	mobType = MOB_NPC,
	level = 300,
	chanceHit = 200,
	damageMin = 145,
	damageMax = 300,
	baseXp = 8549,
	baseHAM = 205000,
	baseHAMmax = 225000,
	armor = 2,
	resists = {15, 15, 15, 19, 7, 15, 15, 15, 15},
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
	creatureBitmask = KILLER + STALKER,
	optionsBitmask = 128,
	diet = HERBIVORE,
	scale = 0.9,
	customAiMap = "",

	templates = {
		"object/mobile/dressed_ewok_f_02.iff",
		"object/mobile/dressed_ewok_m_03.iff"
	},

	lootGroups = {
		{
			groups = {
				{group = "holocron_light", chance = 1250000},
				{group = "holocron_dark", chance = 1250000},
				{group = "rifles", chance = 1250000},
				{group = "pistols", chance = 1250000},
				{group = "melee_weapons", chance = 1250000},
				{group = "armor_attachments", chance = 1250000},
				{group = "clothing_attachments", chance = 1250000},
				{group = "carbines", chance = 1250000}
			},
			lootChance = 10000000
		}
	},

	-- Primary and secondary weapon should be different types (rifle/carbine, carbine/pistol, rifle/unarmed, etc)
	-- Unarmed should be put on secondary unless the mobile doesn't use weapons, in which case "unarmed" should be put primary and "none" as secondary
	primaryWeapon = "st_bombardier_weapons",
	secondaryWeapon = "none",

	-- primaryAttacks and secondaryAttacks should be separate skill groups specific to the weapon type listed in primaryWeapon and secondaryWeapon
	-- Use merge() to merge groups in creatureskills.lua together. If a weapon is set to "none", set the attacks variable to empty brackets
	primaryAttacks = merge(brawlermaster,marksmanmaster),
	secondaryAttacks = {},
	conversationTemplate = ""
}

CreatureTemplates:addCreatureTemplate(ewok_protector, "ewok_protector")