vincieKalhoonConvoHandler = conv_handler:new {}

function vincieKalhoonConvoHandler:getInitialScreen(pPlayer, pNpc, pConvTemplate)
	local convoTemplate = LuaConversationTemplate(pConvTemplate)

	CreatureObject(pNpc):doAnimation("beckon")

	return convoTemplate:getScreen("hey_kid_cmere")
end

function vincieKalhoonConvoHandler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
	local stringFile = "@conversation/greeter_mos_eisley_smuggler_fat"
	local screen = LuaConversationScreen(pConvScreen)
	local screenID = screen:getScreenID()
	local pConvScreen = screen:cloneScreen()
	local clonedConversation = LuaConversationScreen(pConvScreen)

	if (screenID == "i_see_i") then
		CreatureObject(pNpc):doAnimation("laugh_cackle")
	elseif (screenID == "overdue_for_what") then
		CreatureObject(pNpc):doAnimation("explain")
	end

	return pConvScreen
end

