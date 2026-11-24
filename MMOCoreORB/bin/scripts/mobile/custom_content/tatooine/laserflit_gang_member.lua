laserflit_gang_member = Creature:new {
	customName = "a Laserflit gang member",
	socialGroup = "laserflit",
	faction = "laserflit",
	mobType = MOB_NPC,
	level = 32,
	chanceHit = 0.39,
	damageMin = 310,
	damageMax = 330,
	baseXp = 3188,
	baseHAM = 8400,
	baseHAMmax = 10200,
	armor = 0,
	resists = {1, 2, 1, -1, -1, 3, 3, -1, -1},
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
	creatureBitmask = PACK + HERD,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,
	scale = 1,
	customAiMap = "",

	templates = {
		"object/mobile/dressed_tatooine_laserflit_hum_f01.iff",
		"object/mobile/dressed_tatooine_laserflit_hum_f02.iff",
		"object/mobile/dressed_tatooine_laserflit_aqualish_f01.iff",
		"object/mobile/dressed_tatooine_laserflit_hum_m01.iff",
		"object/mobile/dressed_tatooine_laserflit_hum_m02.iff",
		"object/mobile/dressed_tatooine_laserflit_itib_m_01.iff"
	},

	lootGroups = {
		{
			groups = {
				{group = "junk", chance = 3500000},
				{group = "loot_kit_parts", chance = 3000000},
				{group = "armor_attachments", chance = 500000},
				{group = "clothing_attachments", chance = 500000},
				{group = "wearables_common", chance = 1000000},
				{group = "wearables_uncommon", chance = 1000000},
				{group = "color_crystals", chance = 500000}
			}
		}
	},

	-- Primary and secondary weapon should be different types (rifle/carbine, carbine/pistol, rifle/unarmed, etc)
	-- Unarmed should be put on secondary unless the mobile doesn't use weapons, in which case "unarmed" should be put primary and "none" as secondary
	primaryWeapon = "blood_razer_weapons",
	secondaryWeapon = "none",

	-- primaryAttacks and secondaryAttacks should be separate skill groups specific to the weapon type listed in primaryWeapon and secondaryWeapon
	-- Use merge() to merge groups in creatureskills.lua together. If a weapon is set to "none", set the attacks variable to empty brackets
	primaryAttacks = merge(pistoleermaster,pikemanmaster,tkamaster,brawlermaster,marksmanmaster),
	secondaryAttacks = {},
	conversationTemplate = "",
	reactionStf = "@npc_reaction/slang"
}

CreatureTemplates:addCreatureTemplate(laserflit_gang_member, "laserflit_gang_member")