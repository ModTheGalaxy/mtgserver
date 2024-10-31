--Start--
object_tangible_wearables_robe_robe_jedi_dark_s03 = object_tangible_wearables_robe_shared_robe_jedi_dark_s03:new {
	playerRaces = { "object/creature/player/bothan_male.iff",
		"object/creature/player/bothan_female.iff",
		"object/creature/player/human_male.iff",
		"object/creature/player/human_female.iff",
		"object/creature/player/ithorian_male.iff",
		"object/creature/player/ithorian_female.iff",
		"object/creature/player/moncal_male.iff",
		"object/creature/player/moncal_female.iff",
		"object/creature/player/rodian_male.iff",
		"object/creature/player/rodian_female.iff",
		"object/creature/player/sullustan_male.iff",
		"object/creature/player/sullustan_female.iff",
		"object/creature/player/trandoshan_male.iff",
		"object/creature/player/trandoshan_female.iff",
		"object/creature/player/twilek_male.iff",
		"object/creature/player/twilek_female.iff",
		"object/creature/player/wookiee_male.iff",
		"object/creature/player/wookiee_female.iff",
		"object/creature/player/zabrak_male.iff",
		"object/creature/player/zabrak_female.iff" },

	maxCondition = 100,
	volume = 1,
	jediRobe = true,

	skillMods = {
		{"jedi_force_power_max", 250},
		{"jedi_force_power_regen", 10}
	},

	noTrade = 1,

	objectMenuComponent = "RobeObjectMenuComponent",
	certificationsRequired = {"force_rank_dark_rank_05"},
	attributeListComponent = "JediRobeAttributeListComponent",
}

ObjectTemplates:addTemplate(object_tangible_wearables_robe_robe_jedi_dark_s03, "object/tangible/wearables/robe/robe_jedi_dark_s03.iff")
--End--
