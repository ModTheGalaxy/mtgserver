stormtrooper_pve = Creature:new {
	objectName = "",
	customName = "Imperial Jedi Hunter",
	socialGroup = "Dark Jedi",
	faction = "",
	mobType = MOB_NPC,
	level = 50,
	chanceHit = 300,
	damageMin = 145,
	damageMax = 300,
	baseXp = 8549,
	baseHAM = 25000,
	baseHAMmax = 37000,
	armor = 2,
	resists = {4, 6, 4, 7, 3, 11, 9, 10, 6},
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
	scale = 1.1,
	customAiMap = "",

	templates = {
		"object/mobile/dressed_stormtrooper_commando_m.iff",
		"object/mobile/dressed_stormtrooper_m.iff",
		"object/mobile/dressed_stormtrooper_sniper_m.iff"
	},

	lootGroups = {
		{
			groups = {
				{group = "holocron_light", chance = 1250000},
				{group = "krayt_pearls", chance = 1250000},
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
	primaryWeapon = "unarmed_weapons",
	secondaryWeapon = "none",

	-- primaryAttacks and secondaryAttacks should be separate skill groups specific to the weapon type listed in primaryWeapon and secondaryWeapon
	-- Use merge() to merge groups in creatureskills.lua together. If a weapon is set to "none", set the attacks variable to empty brackets
	primaryAttacks = merge(tkamaster,brawlermaster),
	secondaryAttacks = {},
	conversationTemplate = ""
}

CreatureTemplates:addCreatureTemplate(stormtrooper_pve, "stormtrooper_pve")