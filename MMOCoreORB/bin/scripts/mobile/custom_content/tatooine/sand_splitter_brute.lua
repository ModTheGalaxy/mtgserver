sand_splitter_brute = Creature:new {
	customName = "a Sand splitter brute",
	socialGroup = "sand_splitter",
	faction = "sand_splitter",
	mobType = MOB_NPC,
	level = 24,
	chanceHit = 0.35,
	damageMin = 230,
	damageMax = 240,
	baseXp = 2543,
	baseHAM = 6800,
	baseHAMmax = 8300,
	armor = 0,
	resists = {1, 1, 1, 1, 1, -1, -1, -1, -1},
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
		"object/mobile/dressed_corsair_cutthroat_hum_f.iff",
		"object/mobile/dressed_corsair_cutthroat_hum_m.iff",
		"object/mobile/dressed_corsair_cutthroat_zab_m.iff",
		"object/mobile/dressed_corsair_guard_hum_f.iff",
		"object/mobile/dressed_corsair_guard_hum_m.iff",
		"object/mobile/dressed_corsair_guard_nikto_m.iff",
		"object/mobile/dressed_corsair_guard_rod_m.iff"
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

CreatureTemplates:addCreatureTemplate(sand_splitter_brute, "sand_splitter_brute")