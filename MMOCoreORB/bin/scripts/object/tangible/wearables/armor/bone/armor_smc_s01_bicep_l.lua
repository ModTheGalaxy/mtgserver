--Start--
object_tangible_wearables_armor_bone_armor_smc_s01_bicep_l = object_tangible_wearables_armor_bone_shared_armor_smc_s01_bicep_l:new {
	templateType = ARMOROBJECT,

	playerRaces = { "object/creature/player/bothan_male.iff",
				"object/creature/player/bothan_female.iff",
				"object/creature/player/human_male.iff",
				"object/creature/player/human_female.iff",
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
				"object/creature/player/zabrak_male.iff",
				"object/creature/player/zabrak_female.iff",
				"object/mobile/vendor/aqualish_female.iff",
				"object/mobile/vendor/aqualish_male.iff",
				"object/mobile/vendor/bith_female.iff",
				"object/mobile/vendor/bith_male.iff",
				"object/mobile/vendor/bothan_female.iff",
				"object/mobile/vendor/bothan_male.iff",
				"object/mobile/vendor/devaronian_male.iff",
				"object/mobile/vendor/gran_male.iff",
				"object/mobile/vendor/human_female.iff",
				"object/mobile/vendor/human_male.iff",
				"object/mobile/vendor/ishi_tib_male.iff",
				"object/mobile/vendor/moncal_female.iff",
				"object/mobile/vendor/moncal_male.iff",
				"object/mobile/vendor/nikto_male.iff",
				"object/mobile/vendor/quarren_male.iff",
				"object/mobile/vendor/rodian_female.iff",
				"object/mobile/vendor/rodian_male.iff",
				"object/mobile/vendor/sullustan_female.iff",
				"object/mobile/vendor/sullustan_male.iff",
				"object/mobile/vendor/trandoshan_female.iff",
				"object/mobile/vendor/trandoshan_male.iff",
				"object/mobile/vendor/twilek_female.iff",
				"object/mobile/vendor/twilek_male.iff",
				"object/mobile/vendor/weequay_male.iff",
				"object/mobile/vendor/zabrak_female.iff",
				"object/mobile/vendor/zabrak_male.iff" },
	
	-- kineticeffectiveness, energyeffectiveness, electricaleffectiveness, stuneffectiveness, blasteffectiveness, heateffectiveness, coldeffectiveness, acideffectiveness, restraineffectiveness
	vulnerability = KINETIC + BLAST + STUN + HEAT + COLD + ACID + LIGHTSABER,

	-- These are default Blue Frog stats
	healthEncumbrance = 6,
	actionEncumbrance = 15,
	mindEncumbrance = 4,

	-- LIGHT, MEDIUM, HEAVY
	rating = LIGHT,

	kinetic = 0,
	energy = 20,
	electricity = 10,
	stun = 0,
	blast = 0,
	heat = 0,
	cold = 0,
	acid = 0,
	lightSaber = 0
}

ObjectTemplates:addTemplate(object_tangible_wearables_armor_bone_armor_smc_s01_bicep_l, "object/tangible/wearables/armor/bone/armor_smc_s01_bicep_l.iff")
--End--
