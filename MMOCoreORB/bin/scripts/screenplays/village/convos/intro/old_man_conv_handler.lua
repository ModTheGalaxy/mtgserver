local QuestManager = require("managers.quest.quest_manager")

oldManIntroConvoHandler = conv_handler:new {}

function oldManIntroConvoHandler:getInitialScreen(pPlayer, pNpc, pConvTemplate)
	local convoTemplate = LuaConversationTemplate(pConvTemplate)
	if OldManOutroEncounter:doesOldManBelongToThePlayer(pPlayer, pNpc) then
		return convoTemplate:getScreen("intro_mellichae")
	elseif OldManIntroEncounter:doesOldManBelongToThePlayer(pPlayer, pNpc) then
		return convoTemplate:getScreen("intro")
	else
		return convoTemplate:getScreen("nothing_to_discuss")
	end
end

function oldManIntroConvoHandler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
	local screen = LuaConversationScreen(pConvScreen)

	local screenID = screen:getScreenID()

	if screenID == "intro_mellichae" then
		local clonedScreen = screen:cloneScreen()
		LuaConversationScreen(clonedScreen):setCustomDialogText("We meet again. The Sith Shadow leader Mellichae must be stopped. Are you ready to seek him out?")
		return clonedScreen
	elseif screenID == "perhaps_meet_again" or screenID == "perhaps_another_time" then
		CreatureObject(pNpc):clearOptionBit(CONVERSABLE)
		local kind = OldManOutroEncounter:doesOldManBelongToThePlayer(pPlayer, pNpc) and "outro" or "intro"
		JediShrineProgression:finishMeeting(pPlayer, kind, false)
	elseif screenID == "here_is_the_crystal" then
		if (OldManIntroEncounter:giveForceCrystalToPlayer(pPlayer)) then
			CreatureObject(pNpc):clearOptionBit(CONVERSABLE)
			JediShrineProgression:finishMeeting(pPlayer, "intro", true)
			FsIntro:startStepDelay(pPlayer, FsIntro.SITHWAIT)
		end
	elseif screenID == "where_camp" then
		if (not JediTrials:hasCompletedPadawanTasks(pPlayer)) then
			CreatureObject(pPlayer):sendSystemMessage("Complete all Padawan trials before seeking Mellichae.")
			return pConvScreen
		end
		if (not MellichaeOutroTheater:hasTaskStarted(pPlayer) and not MellichaeOutroTheater:start(pPlayer)) then
			printLuaError("oldManIntroConvoHandler: failed to start Mellichae encounter for " .. SceneObject(pPlayer):getObjectID())
			CreatureObject(pPlayer):sendSystemMessage("Mellichae's camp could not be located. Speak to the Old Man to try again.")
			return pConvScreen
		end
		-- Update player FS Progression
		FsOutro:setCurrentStep(pPlayer, 3)

		-- Clear conversable option bit and schedule Removal of old man agent
		CreatureObject(pNpc):clearOptionBit(CONVERSABLE)
		JediShrineProgression:finishMeeting(pPlayer, "outro", true)

		-- Update players quest status
		QuestManager.completeQuest(pPlayer, QuestManager.quests.OLD_MAN_FINAL)
	end

	return pConvScreen
end
