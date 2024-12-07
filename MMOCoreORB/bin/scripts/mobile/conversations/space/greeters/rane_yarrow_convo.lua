rane_yarrow_convo_template = ConvoTemplate:new {
	initialScreen = "",
	templateType = "Lua",
	luaClassHandler = "raneYarrowConvoHandler",
	screens = {}
}

look_were_having = ConvoScreen:new {
	id = "look_were_having",
	leftDialog = "@conversation/greeter_dantooine_brother_neutral:s_82bf2365", -- Look, we're having kind of a family crisis here. I'm not sure I can talk much.
	stopConversation = "false",
	options = {
		{"@conversation/greeter_dantooine_brother_neutral:s_9e23c971", "what_kind_of"}, -- What kind of family crisis?
	}
}
rane_yarrow_convo_template:addScreen(look_were_having);

what_kind_of = ConvoScreen:new {
	id = "what_kind_of",
	leftDialog = "@conversation/greeter_dantooine_brother_neutral:s_c4de0e45", -- Well, these two knuckleheads, my brothers, wanted to become pilots like me. Unlike me, though, they decided they would join the military and get free training. Stupid move if you ask me, but there it is. Only problem is that they didn't check with one another before joining, and now Fern is an Imperial pilot while Kess joined the Alliance.
	stopConversation = "false",
	options = {
		{"@conversation/greeter_dantooine_brother_neutral:s_21394e94", "ouch_thats_definitely"}, -- Ouch, that's definitely a problem.
	}
}
rane_yarrow_convo_template:addScreen(what_kind_of);

ouch_thats_definitely = ConvoScreen:new {
	id = "ouch_thats_definitely",
	leftDialog = "@conversation/greeter_dantooine_brother_neutral:s_1ed4d61", -- You're telling me! They don't always get along, but neither wants to fight against the other in this war if it comes to that. To be honest, they didn't really even join up in order to fight anyone. They just wanted to be trained as pilots.
	stopConversation = "false",
	options = {
		{"@conversation/greeter_dantooine_brother_neutral:s_4c4f0209", "and_youre_not"}, -- And you're not on either side?
	}
}
rane_yarrow_convo_template:addScreen(ouch_thats_definitely);

and_youre_not = ConvoScreen:new {
	id = "and_youre_not",
	leftDialog = "@conversation/greeter_dantooine_brother_neutral:s_219ea9a7", -- Oh, no. I fly for myself. Well, mostly. I take jobs from various sources. I'll admit it's not easy thanks to the Empire trying to control who can fly and who can't. But I get by. Fern and Kess thought they'd be better off with full military support, but I think they'll regret that decision. Actually, they already do.
	stopConversation = "true",
	options = {}
}
rane_yarrow_convo_template:addScreen(and_youre_not);

addConversationTemplate("rane_yarrow_convo_template", rane_yarrow_convo_template);
