vincie_kalhoon_convo_template = ConvoTemplate:new {
	initialScreen = "",
	templateType = "Lua",
	luaClassHandler = "vincieKalhoonConvoHandler",
	screens = {}
}

hey_kid_cmere = ConvoScreen:new {
	id = "hey_kid_cmere",
	leftDialog = "@conversation/greeter_mos_eisley_smuggler_fat:s_db81b074", -- Hey kid, c'mere. When you arrived, did you happen to see a human pilot with a thick beard? He's an associate of ours, and he's overdue.
	stopConversation = "false",
	options = {
		{"@conversation/greeter_mos_eisley_smuggler_fat:s_6795b6ad", "overdue_for_what"}, -- Overdue? For what?
	}
}
vincie_kalhoon_convo_template:addScreen(hey_kid_cmere);

overdue_for_what = ConvoScreen:new {
	id = "overdue_for_what",
	leftDialog = "@conversation/greeter_mos_eisley_smuggler_fat:s_9a679691", -- My associates and I all went in together on a business venture of sorts. Needless to say, we eagerly await his return with, I'm quite certain, good news about the outcome of the this venture. The thing is, though, that our friend has apparently been delayed. He's a number of days overdue, and we're quite concerned. About our friend, of course, as well as our potential profits.
	stopConversation = "false",
	options = {
		{"@conversation/greeter_mos_eisley_smuggler_fat:s_3d5a0af7", "i_see_i"}, -- I see. I hope he arrives safely and soon.
	}
}
vincie_kalhoon_convo_template:addScreen(overdue_for_what);

i_see_i = ConvoScreen:new {
	id = "i_see_i",
	leftDialog = "@conversation/greeter_mos_eisley_smuggler_fat:s_8ae971c3", -- Thank you for the kind words.
	stopConversation = "true",
	options = {
	}
}
vincie_kalhoon_convo_template:addScreen(i_see_i);

addConversationTemplate("vincie_kalhoon_convo_template", vincie_kalhoon_convo_template);
