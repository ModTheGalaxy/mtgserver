guillo_parootchie_convo_template = ConvoTemplate:new {
	initialScreen = "",
	templateType = "Lua",
	luaClassHandler = "guilloParootchieConvoHandler",
	screens = {}
}

what_why_you = ConvoScreen:new {
	id = "what_why_you",
	leftDialog = "@conversation/greeter_mos_eisley_smuggler_nervous:s_84b70aa7", -- What? Why you looking at me like that?
	stopConversation = "false",
	options = {
		{"@conversation/greeter_mos_eisley_smuggler_nervous:s_db2bb45d", "what_are_you"}, -- What are you guys doing?
	}
}
guillo_parootchie_convo_template:addScreen(what_why_you);

what_are_you = ConvoScreen:new {
	id = "what_are_you",
	leftDialog = "@conversation/greeter_mos_eisley_smuggler_nervous:s_6532c5fc", -- Nothing. I mean, we're waiting for someone. He's not coming. I mean, he's been delayed or something.
	stopConversation = "false",
	options = {
		{"@conversation/greeter_mos_eisley_smuggler_nervous:s_48a73671", "why_has_he"}, -- Why has he been delayed?
	}
}
guillo_parootchie_convo_template:addScreen(what_are_you);

why_has_he = ConvoScreen:new {
	id = "why_has_he",
	leftDialog = "@conversation/greeter_mos_eisley_smuggler_nervous:s_7b971344", -- How should I know?!! Why're you hassling me? It's not like I could have known what would happen. I mean, I don't know anything. Look, just go away, alright?
	stopConversation = "false",
	options = {
		{"@conversation/greeter_mos_eisley_smuggler_nervous:s_2f5237f2", "yeah_okay_sorry"}, -- Yeah, okay. Sorry. Didn't mean to upset you.
	}
}
guillo_parootchie_convo_template:addScreen(why_has_he);

yeah_okay_sorry = ConvoScreen:new {
	id = "yeah_okay_sorry",
	leftDialog = "@conversation/greeter_mos_eisley_smuggler_nervous:s_b035eb47", -- It's nothing. Just forget it.
	stopConversation = "true",
	options = {
	}
}
guillo_parootchie_convo_template:addScreen(yeah_okay_sorry);

addConversationTemplate("guillo_parootchie_convo_template", guillo_parootchie_convo_template);
