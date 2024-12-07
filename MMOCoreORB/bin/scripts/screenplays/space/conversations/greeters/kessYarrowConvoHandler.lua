kessYarrowConvoHandler = conv_handler:new {}

function kessYarrowConvoHandler:getInitialScreen(pPlayer, pNpc, pConvTemplate)
	local convoTemplate = LuaConversationTemplate(pConvTemplate)

	return convoTemplate:getScreen("of_all_the")
end

function kessYarrowConvoHandler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
	local stringFile = "@conversation/greeter_dantooine_brother_rebel"
	local screen = LuaConversationScreen(pConvScreen)
	local screenID = screen:getScreenID()
	local pConvScreen = screen:cloneScreen()
	local clonedConversation = LuaConversationScreen(pConvScreen)

	return pConvScreen
end

