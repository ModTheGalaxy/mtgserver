kultonWoodleConvoHandler = conv_handler:new {}

function kultonWoodleConvoHandler:getInitialScreen(pPlayer, pNpc, pConvTemplate)
	local convoTemplate = LuaConversationTemplate(pConvTemplate)

	if (not CreatureObject(pPlayer):hasSkill("social_language_moncalamari_speak")) then
		CreatureObject(pNpc):doAnimation("point_left")
		return convoTemplate:getScreen("no_moncal")
	end

	CreatureObject(pNpc):doAnimation("beckon")

	return convoTemplate:getScreen("hello_hello_you")
end

function kultonWoodleConvoHandler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
	local stringFile = "@conversation/greeter_theed_freighter_captain"
	local screen = LuaConversationScreen(pConvScreen)
	local screenID = screen:getScreenID()
	local pConvScreen = screen:cloneScreen()
	local clonedConversation = LuaConversationScreen(pConvScreen)

	if (screenID == "that_makes_sense") then
		CreatureObject(pNpc):doAnimation("nod_head_once")
	elseif (screenID == "why_dont_you") then
		CreatureObject(pNpc):doAnimation("explain")
	end

	return pConvScreen
end

