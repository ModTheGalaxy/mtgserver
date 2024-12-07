guilloParootchieConvoHandler = conv_handler:new {}

function guilloParootchieConvoHandler:getInitialScreen(pPlayer, pNpc, pConvTemplate)
	local convoTemplate = LuaConversationTemplate(pConvTemplate)

	CreatureObject(pNpc):doAnimation("nervous")

	return convoTemplate:getScreen("what_why_you")
end

function guilloParootchieConvoHandler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
	local stringFile = "@conversation/greeter_mos_eisley_smuggler_nervous"
	local screen = LuaConversationScreen(pConvScreen)
	local screenID = screen:getScreenID()
	local pConvScreen = screen:cloneScreen()
	local clonedConversation = LuaConversationScreen(pConvScreen)

	if (screenID == "what_are_you" or screenID == "yeah_okay_sorry") then
		CreatureObject(pNpc):doAnimation("nervous")
	elseif  (screenID == "why_has_he") then
		CreatureObject(pNpc):doAnimation("gesticulate_wildly")
	end

	return pConvScreen
end

