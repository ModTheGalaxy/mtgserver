kulton_woodle_convo_template = ConvoTemplate:new {
	initialScreen = "",
	templateType = "Lua",
	luaClassHandler = "kultonWoodleConvoHandler",
	screens = {}
}

no_moncal = ConvoScreen:new {
	id = "no_moncal",
	leftDialog = "@conversation/greeter_theed_freighter_captain:s_a8aae630", -- [He doesn't say anything, but gestures toward his protocol droid.]
	stopConversation = "true",
	options = {}
}
kulton_woodle_convo_template:addScreen(no_moncal);

hello_hello_you = ConvoScreen:new {
	id = "hello_hello_you",
	leftDialog = "@conversation/greeter_theed_freighter_captain:s_c00207b0", -- Hello. Hello. You have the look of one seeking adventures in space. Flying is the only part of the job I miss. I was a captain on a freighter, you see. Flew all over the galaxy. Ah, nothing matches being at the helm of a ship flying through the deep, black reaches of space.
	stopConversation = "false",
	options = {
		{"@conversation/greeter_theed_freighter_captain:s_232bfee8", "why_dont_you"}, -- Why don't you fly any more?
	}
}
kulton_woodle_convo_template:addScreen(hello_hello_you);

why_dont_you = ConvoScreen:new {
	id = "why_dont_you",
	leftDialog = "@conversation/greeter_theed_freighter_captain:s_e6b5489e", -- I retired. And I'm pretty happy about it. The only thing I miss is the flying. The rest of it can rot. All the forms and logs to keep track of, safeguarding your cargo, having to deal with bureaucracy and red tape every time you docked at a space station or planetary starport. No thanks. It is the journey I miss, but not the destinations.
	stopConversation = "false",
	options = {
		{"@conversation/greeter_theed_freighter_captain:s_2099fa73", "interesting_why_are"}, -- Interesting. Why are you here outside the hangar?
	}
}
kulton_woodle_convo_template:addScreen(why_dont_you);

interesting_why_are = ConvoScreen:new {
	id = "interesting_why_are",
	leftDialog = "@conversation/greeter_theed_freighter_captain:s_3c8b5d06", -- I enjoy talking to pilots and hearing about their flights. Takes me back to some of my own best memories. Helps me to relive them.
	stopConversation = "false",
	options = {
		{"@conversation/greeter_theed_freighter_captain:s_5cd38acb", "that_makes_sense"}, -- That makes sense. Have fun with that.
	}
}
kulton_woodle_convo_template:addScreen(interesting_why_are);

that_makes_sense = ConvoScreen:new {
	id = "that_makes_sense",
	leftDialog = "@conversation/greeter_theed_freighter_captain:s_366f0593", -- Oh I will. I do.
	stopConversation = "true",
	options = {}
}
kulton_woodle_convo_template:addScreen(that_makes_sense);

addConversationTemplate("kulton_woodle_convo_template", kulton_woodle_convo_template);
