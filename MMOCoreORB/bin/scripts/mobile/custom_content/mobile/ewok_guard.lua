ewok_guard = Creature:new {
	objectName = "",
	customName = "An Ewok Guard",
	socialGroup = "Dark Jedi",
	faction = "",
	mobType = MOB_NPC,
	level = 295,
	chanceHit = 0.29,
	damageMin = 650,
	damageMax = 750,
	baseXp = 709,
	baseHAM = 195000,
	baseHAMmax = 205000,
	armor = 0,
	resists = {5, 5, 0, 0, 0, 0, 0, -1, -1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = AGGRESSIVE + ATTACKABLE,
	creatureBitmask = PACK + KILLER,
	optionsBitmask = 128,
	diet = HERBIVORE,
	scale = 0.7,
	customAiMap = "",

	templates = {
		"object/mobile/dressed_ewok_f_04.iff",
		"object/mobile/dressed_ewok_f_09.iff",
		"object/mobile/dressed_ewok_m_07.iff",
		"object/mobile/dressed_ewok_m_02.iff"
	},

	lootGroups = {
		{
			groups = {
				{group = "ewok", chance = 10000000}
			},
			lootChance = 3000000
		}
	},

	-- Primary and secondary weapon should be different types (rifle/carbine, carbine/pistol, rifle/unarmed, etc)
	-- Unarmed should be put on secondary unless the mobile doesn't use weapons, in which case "unarmed" should be put primary and "none" as secondary
	primaryWeapon = "darth_vader_weapons",
	secondaryWeapon = "none",

	-- primaryAttacks and secondaryAttacks should be separate skill groups specific to the weapon type listed in primaryWeapon and secondaryWeapon
	-- Use merge() to merge groups in creatureskills.lua together. If a weapon is set to "none", set the attacks variable to empty brackets
	primaryAttacks = merge(lightsabermaster,forcepowermaster),
	secondaryAttacks = {},
	conversationTemplate = ""
}

CreatureTemplates:addCreatureTemplate(ewok_guard, "ewok_guard")