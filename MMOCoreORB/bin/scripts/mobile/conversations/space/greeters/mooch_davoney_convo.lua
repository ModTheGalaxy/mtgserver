mooch_davoney_convo_template = ConvoTemplate:new {
	initialScreen = "",
	templateType = "Lua",
	luaClassHandler = "moochDavoneyConvoHandler",
	screens = {}
}

yeah__ = ConvoScreen:new {
	id = "yeah__",
	leftDialog = "@conversation/greeter_mos_eisley_smuggler_skinny:s_e547fd1e", -- Yeah?
	stopConversation = "false",
	options = {
		{"@conversation/greeter_mos_eisley_smuggler_skinny:s_db2bb45d", "what_are_you"}, -- What are you guys doing?
	}
}
mooch_davoney_convo_template:addScreen(yeah__);

what_are_you = ConvoScreen:new {
	id = "what_are_you",
	leftDialog = "@conversation/greeter_mos_eisley_smuggler_skinny:s_43834150", -- Waiting on a friend.
	stopConversation = "false",
	options = {
		{"@conversation/greeter_mos_eisley_smuggler_skinny:s_31745b41", "oh_your_friends"}, -- Oh. Your friend's a pilot?
	}
}
mooch_davoney_convo_template:addScreen(what_are_you);

oh_your_friends = ConvoScreen:new {
	id = "oh_your_friends",
	leftDialog = "@conversation/greeter_mos_eisley_smuggler_skinny:s_d70dba34", -- Yes.
	stopConversation = "false",
	options = {
		{"@conversation/greeter_mos_eisley_smuggler_skinny:s_bcf6e2d1", "hes_returning_from"}, -- He's returning from a trip?
	}
}
mooch_davoney_convo_template:addScreen(oh_your_friends);

hes_returning_from = ConvoScreen:new {
	id = "hes_returning_from",
	leftDialog = "@conversation/greeter_mos_eisley_smuggler_skinny:s_5e5566b0", -- Yes, but he's late.
	stopConversation = "false",
	options = {
		{"@conversation/greeter_mos_eisley_smuggler_skinny:s_2c450d35", "whys_he_late"}, -- Why's he late?
	}
}
mooch_davoney_convo_template:addScreen(hes_returning_from);

whys_he_late = ConvoScreen:new {
	id = "whys_he_late",
	leftDialog = "@conversation/greeter_mos_eisley_smuggler_skinny:s_d5df1462", -- Don't know.
	stopConversation = "false",
	options = {
		{"@conversation/greeter_mos_eisley_smuggler_skinny:s_29ccc793", "oh_have_fun"}, -- Oh. Have fun waiting.
	}
}
mooch_davoney_convo_template:addScreen(whys_he_late);

oh_have_fun = ConvoScreen:new {
	id = "oh_have_fun",
	leftDialog = "@conversation/greeter_mos_eisley_smuggler_skinny:s_67e6df55", -- Okay.
	stopConversation = "true",
	options = {
	}
}
mooch_davoney_convo_template:addScreen(oh_have_fun);

addConversationTemplate("mooch_davoney_convo_template", mooch_davoney_convo_template);
