tarth_jaxx_convo_template = ConvoTemplate:new {
	initialScreen = "",
	templateType = "Lua",
	luaClassHandler = "tarthJaxxConvoHandler",
	screens = {}
}

no_jtl = ConvoScreen:new {
	id = "no_jtl",
	leftDialog = "@conversation/greeter_coronet_shipwright_impatient:s_ca20e884", -- I'm not really in a giving mood. Try asking the merchant. It's the least he could do.
	stopConversation = "true",
	options = {}
}
tarth_jaxx_convo_template:addScreen(no_jtl);

i_cannot_believe = ConvoScreen:new {
	id = "i_cannot_believe",
	leftDialog = "@conversation/greeter_coronet_shipwright_impatient:s_252f6fb9", -- I cannot believe we have been wasting our time standing here. What kind of merchant sells ship parts that they can't deliver?!!? Not exactly a model way to run a business. I'm not buying anything from this guy ever again.
	stopConversation = "false",
	options = {
		{"@conversation/greeter_coronet_shipwright_impatient:s_e5210282", "why_not_what"}, -- Why not? What happened?
	}
}
tarth_jaxx_convo_template:addScreen(i_cannot_believe);

why_not_what = ConvoScreen:new {
	id = "why_not_what",
	leftDialog = "@conversation/greeter_coronet_shipwright_impatient:s_4668c9d5", -- I'll tell you what happened. We paid for ship parts that this guy doesn't have. Oh sure, he claimed they'd be delivered with his next shipment, but it's been days now. Where's this mythical shipment? Starships don't just disappear! Well, not normally.
	stopConversation = "false",
	options = {
		{"@conversation/greeter_coronet_shipwright_impatient:s_9cc3fb32", "sometimes_you_just"}, -- Sometimes you just have to have patience.
	}
}
tarth_jaxx_convo_template:addScreen(why_not_what);

sometimes_you_just = ConvoScreen:new {
	id = "sometimes_you_just",
	leftDialog = "@conversation/greeter_coronet_shipwright_impatient:s_79bcfacd", -- Spare me the lecture. My comrade has already given me that one more than enough times. I want the parts I paid for. Not empty words!
	stopConversation = "true",
	options = {}
}
tarth_jaxx_convo_template:addScreen(sometimes_you_just);

addConversationTemplate("tarth_jaxx_convo_template", tarth_jaxx_convo_template);
