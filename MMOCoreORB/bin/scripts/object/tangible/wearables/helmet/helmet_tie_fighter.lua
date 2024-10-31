--Start--
object_tangible_wearables_helmet_helmet_tie_fighter = object_tangible_wearables_helmet_shared_helmet_tie_fighter:new {
	faction = "Imperial",

	playerRaces = { "object/creature/player/human_male.iff",
				"object/creature/player/human_female.iff",
				"object/creature/player/zabrak_male.iff",
				"object/creature/player/zabrak_female.iff",
				"object/mobile/vendor/human_female.iff",
				"object/mobile/vendor/human_male.iff",
				"object/mobile/vendor/zabrak_female.iff",
				"object/mobile/vendor/zabrak_male.iff" },
}

ObjectTemplates:addTemplate(object_tangible_wearables_helmet_helmet_tie_fighter, "object/tangible/wearables/helmet/helmet_tie_fighter.iff")
--End--
