kess_yarrow_convo_template = ConvoTemplate:new {
	initialScreen = "",
	templateType = "Lua",
	luaClassHandler = "kessYarrowConvoHandler",
	screens = {}
}

of_all_the = ConvoScreen:new {
	id = "of_all_the",
	leftDialog = "@conversation/greeter_dantooine_brother_rebel:s_7ea269a5", -- Of all the stubborn, no-account, 'don't bother to say anything to your brother' brothers, mine is definitely the worst! By far. No one else could ever come close.
	stopConversation = "false",
	options = {
		{"@conversation/greeter_dantooine_brother_rebel:s_91cb4419", "you_seem_to"}, -- You seem to be upset with your brother?
	}
}
kess_yarrow_convo_template:addScreen(of_all_the);

you_seem_to = ConvoScreen:new {
	id = "you_seem_to",
	leftDialog = "@conversation/greeter_dantooine_brother_rebel:s_6bbf120e", -- With Fern? Absolutely correct! You'd never guess what that no-brain womp rat went and did? Try and guess. Go ahead and try.
	stopConversation = "false",
	options = {
		{"@conversation/greeter_dantooine_brother_rebel:s_e52fbe2d", "he_took_the"}, -- He took the last sweesonberry roll without asking if you wanted one?
		{"@conversation/greeter_dantooine_brother_rebel:s_ad02b6b3", "he_ran_off"}, -- He ran off with your girlfriend and married her?
		{"@conversation/greeter_dantooine_brother_rebel:s_69796047", "he_traded_the"}, -- He traded the family bantha for some magic beans?
	}
}
kess_yarrow_convo_template:addScreen(you_seem_to);

he_took_the = ConvoScreen:new {
	id = "he_took_the",
	leftDialog = "@conversation/greeter_dantooine_brother_rebel:s_b20f640e", -- No, but that's a good guess. That's exactly the kind of thing Fern would do.
	stopConversation = "false",
	options = {
		{"@conversation/greeter_dantooine_brother_rebel:s_f2356ea5", "whats_wrong_with_3"}, -- What's wrong with that?
	}
}
kess_yarrow_convo_template:addScreen(he_took_the);

he_ran_off = ConvoScreen:new {
	id = "he_ran_off",
	leftDialog = "@conversation/greeter_dantooine_brother_rebel:s_af88e52c", -- What!! He ran off with my girlfriend! That son of a kreetle! I can't believe he would do something like that!! Wait a minute, I don't have a girlfriend. No, no, that's not it. That's not it at all.
	stopConversation = "false",
	options = {
		{"@conversation/greeter_dantooine_brother_rebel:s_f2356ea5", "whats_wrong_with_3"}, -- What's wrong with that?
	}
}
kess_yarrow_convo_template:addScreen(he_ran_off);

he_became_an = ConvoScreen:new {
	id = "he_became_an",
	leftDialog = "@conversation/greeter_dantooine_brother_rebel:s_7cedb568", -- Yeah, that's right. I can't believe you guessed it. Wow.
	stopConversation = "false",
	options = {
		{"@conversation/greeter_dantooine_brother_rebel:s_93511893", "why_dont_you_2"}, -- Why don't you join the Empire with your brother?
	}
}
kess_yarrow_convo_template:addScreen(he_became_an);

he_traded_the = ConvoScreen:new {
	id = "he_traded_the",
	leftDialog = "@conversation/greeter_dantooine_brother_rebel:s_19aad16e", -- No. And you need help. Seriously. What the heck are you talking about? Family bantha? Do we look like ranchers? Please. The magic beans sound cool though.
	stopConversation = "false",
	options = {
		{"@conversation/greeter_dantooine_brother_rebel:s_f2356ea5", "whats_wrong_with_3"}, -- What's wrong with that?
	}
}
kess_yarrow_convo_template:addScreen(he_traded_the);

whats_wrong_with = ConvoScreen:new {
	id = "whats_wrong_with",
	leftDialog = "@conversation/greeter_dantooine_brother_rebel:s_a4b89de2", -- What's wrong is that I became a Rebel pilot!
	stopConversation = "false",
	options = {
		{"@conversation/greeter_dantooine_brother_rebel:s_93511893", "why_dont_you_2"}, -- Why don't you join the Empire with your brother?
	}
}
kess_yarrow_convo_template:addScreen(whats_wrong_with);

whats_wrong_with_1 = ConvoScreen:new {
	id = "whats_wrong_with_1",
	leftDialog = "@conversation/greeter_dantooine_brother_rebel:s_a4b89de2", -- What's wrong is that I became a Rebel pilot!
	stopConversation = "false",
	options = {
		{"@conversation/greeter_dantooine_brother_rebel:s_93511893", "why_dont_you_2"}, -- Why don't you join the Empire with your brother?
	}
}
kess_yarrow_convo_template:addScreen(whats_wrong_with_1);

why_dont_you = ConvoScreen:new {
	id = "why_dont_you",
	leftDialog = "@conversation/greeter_dantooine_brother_rebel:s_9b136077", -- That's what Fern keeps insisting. But I'm not sure I trust the Empire. They seem to treat their pilots like fodder by sending wave after wave into battle with no regard for their survival. Fern says that's not the case, but I'm not so sure. And his claims that leaving the Empire might be dangerous do little to boost my confidence. Seriously, I just don't know what to do.
	stopConversation = "false",
	options = {
		{"@conversation/greeter_dantooine_brother_rebel:s_1b178396", "i_wish_i"}, -- I wish I could help, but I'm stumped.
	}
}
kess_yarrow_convo_template:addScreen(why_dont_you);

i_wish_i = ConvoScreen:new {
	id = "i_wish_i",
	leftDialog = "@conversation/greeter_dantooine_brother_rebel:s_d434d6d3", -- I appreciate it anyway.
	stopConversation = "true",
	options = {
	}
}
kess_yarrow_convo_template:addScreen(i_wish_i);

why_dont_you_2 = ConvoScreen:new {
	id = "why_dont_you_2",
	leftDialog = "@conversation/greeter_dantooine_brother_rebel:s_9b136077", -- That's what Fern keeps insisting. But I'm not sure I trust the Empire. They seem to treat their pilots like fodder by sending wave after wave into battle with no regard for their survival. Fern says that's not the case, but I'm not so sure. And his claims that leaving the Empire might be dangerous do little to boost my confidence. Seriously, I just don't know what to do.
	stopConversation = "false",
	options = {
		{"@conversation/greeter_dantooine_brother_rebel:s_1b178396", "i_wish_i"}, -- I wish I could help, but I'm stumped.
	}
}
kess_yarrow_convo_template:addScreen(why_dont_you_2);

whats_wrong_with_3 = ConvoScreen:new {
	id = "whats_wrong_with_3",
	leftDialog = "@conversation/greeter_dantooine_brother_rebel:s_a4b89de2", -- What's wrong is that I became a Rebel pilot!
	stopConversation = "false",
	options = {
		{"@conversation/greeter_dantooine_brother_rebel:s_93511893", "why_dont_you_2"}, -- Why don't you join the Empire with your brother?
	}
}
kess_yarrow_convo_template:addScreen(whats_wrong_with_3);

addConversationTemplate("kess_yarrow_convo_template", kess_yarrow_convo_template);
