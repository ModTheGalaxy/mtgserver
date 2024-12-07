j1_p0_convo_template = ConvoTemplate:new {
	initialScreen = "",
	templateType = "Lua",
	luaClassHandler = "j1p0ConvoHandler",
	screens = {}
}

bid_you_hello = ConvoScreen:new {
	id = "bid_you_hello",
	leftDialog = "@conversation/greeter_theed_protocol_droid:s_2124eaf5", -- I bid you hello. Master Woodle only speaks Mon Calamari. Master Woodle was once a captain on a freighter, but he is now retired.
	stopConversation = "true",
	options = {
	}
}
j1_p0_convo_template:addScreen(bid_you_hello);

addConversationTemplate("j1_p0_convo_template", j1_p0_convo_template);
