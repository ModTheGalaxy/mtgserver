j1p0ConvoHandler = conv_handler:new {}

function j1p0ConvoHandler:getInitialScreen(pPlayer, pNpc, pConvTemplate)
	local convoTemplate = LuaConversationTemplate(pConvTemplate)

	CreatureObject(pNpc):doAnimation("explain")

	return convoTemplate:getScreen("bid_you_hello")
end

function j1p0ConvoHandler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
	local stringFile = "@conversation/greeter_theed_protocol_droid"
	local screen = LuaConversationScreen(pConvScreen)
	local screenID = screen:getScreenID()
	local pConvScreen = screen:cloneScreen()
	local clonedConversation = LuaConversationScreen(pConvScreen)

	return pConvScreen
end

