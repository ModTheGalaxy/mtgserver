fern_yarrow_convo_template = ConvoTemplate:new {
	initialScreen = "",
	templateType = "Lua",
	luaClassHandler = "fernYarrowConvoHandler",
	screens = {}
}

no_jtl = ConvoScreen:new {
	id = "no_jtl",
	leftDialog = "@conversation/greeter_dantooine_brother_imperial:s_7c943cb6", -- "Can you believe this?? Well, actually, you probably won't understand since you don't know anything about space flight. So never mind."
	stopConversation = "true",
	options = {}
}
fern_yarrow_convo_template:addScreen(no_jtl);

rebel_pilot = ConvoScreen:new {
	id = "rebel_pilot",
	leftDialog = "@conversation/greeter_dantooine_brother_imperial:s_ae74cbe5", -- "Oh, another Rebel pilot. Great. I guess you and my brother can go off and fight and have fun, and I'll just sit here by myself. Alone. Great."
	stopConversation = "true",
	options = {}
}
fern_yarrow_convo_template:addScreen(rebel_pilot);

can_you_believe = ConvoScreen:new {
	id = "can_you_believe",
	leftDialog = "@conversation/greeter_dantooine_brother_imperial:s_e53f15d9", -- Can you believe this?? Utterly unbelievable.
	stopConversation = "false",
	options = {
		{"@conversation/greeter_dantooine_brother_imperial:s_3eb6287c", "whats_so_unbelievable"}, -- What's so unbelievable?
		{"@conversation/greeter_dantooine_brother_imperial:s_713ef70", "isnt_fern_a"}, -- Isn't Fern a girl's name?
	}
}
fern_yarrow_convo_template:addScreen(can_you_believe);

whats_so_unbelievable = ConvoScreen:new {
	id = "whats_so_unbelievable",
	leftDialog = "@conversation/greeter_dantooine_brother_imperial:s_6cf025ea", -- My brother, Kess, and I decided to join the military and become pilots. But he joined up with the Rebel Alliance while I became an Imperial pilot. I mean, now we're on opposite sides. This wasn't supposed to happen.
	stopConversation = "false",
	options = {
		{"@conversation/greeter_dantooine_brother_imperial:s_56c322c4", "why_dont_you"}, -- Why don't you leave the Empire and join with your brother?
		{"@conversation/greeter_dantooine_brother_imperial:s_c07f7b6e", "why_doesnt_your"}, -- Why doesn't your brother leave the Rebels and join with you?
		{"@conversation/greeter_dantooine_brother_imperial:s_8dd47fdc", "general_questions"}, -- "Could I ask you some questions?"
	}
}
fern_yarrow_convo_template:addScreen(whats_so_unbelievable);

isnt_fern_a = ConvoScreen:new {
	id = "isnt_fern_a",
	leftDialog = "@conversation/greeter_dantooine_brother_imperial:s_b19f6c96", -- What!? No!! I can't... No!
	stopConversation = "true",
	options = {}
}
fern_yarrow_convo_template:addScreen(isnt_fern_a);

why_dont_you = ConvoScreen:new {
	id = "why_dont_you",
	leftDialog = "@conversation/greeter_dantooine_brother_imperial:s_8092cf42", -- It's not that easy. I get the feeling that the Empire doesn't look kindly upon those who leave. And my training officer is big and mean. I don't think I could handle telling her I want out.
	stopConversation = "false",
	options = {
		{"@conversation/greeter_dantooine_brother_imperial:s_c07f7b6e", "why_doesnt_your"}, -- Why doesn't your brother leave the Rebels and join with you?
	}
}
fern_yarrow_convo_template:addScreen(why_dont_you);

why_doesnt_your = ConvoScreen:new {
	id = "why_doesnt_your",
	leftDialog = "@conversation/greeter_dantooine_brother_imperial:s_a68463ed", -- That's a very good question! One I've yet to get a good answer for. Yeah, why should I be the one to quit? Let Kess quit. I hope he does, because I really don't want to fly against him.
	stopConversation = "true",
	options = {}
}
fern_yarrow_convo_template:addScreen(why_doesnt_your);

general_questions = ConvoScreen:new {
	id = "general_questions",
	leftDialog = "@conversation/greeter_dantooine_brother_imperial:s_a8fdf422", -- "Yeah, sure. What would you like to know?"
	stopConversation = "false",
	options = {
		{"@conversation/greeter_dantooine_brother_imperial:s_add31f19", "need_starship"}, -- "I need a starship."
		{"@conversation/greeter_dantooine_brother_imperial:s_8b23fac", "learn_to_fly"}, -- "I want to learn to fly."
		{"@conversation/greeter_dantooine_brother_imperial:s_cf5fc0f", "how_to_repair"}, --  "How do I repair my starship?"
	}
}
fern_yarrow_convo_template:addScreen(general_questions);

need_starship = ConvoScreen:new {
	id = "need_starship",
	leftDialog = "@conversation/greeter_dantooine_brother_imperial:s_495777c0", -- "Have you checked any vendors? Merchants use vendors to help sell their merchandise. Shipwrights put finished starships and ship components for sale on their vendors, and then you can go to those vendors and purchase what you need."
	stopConversation = "false",
	options = {
		{"@conversation/greeter_dantooine_brother_imperial:s_27186cee", "no_money"}, -- "I don't have enough money."
		{"@conversation/greeter_dantooine_brother_imperial:s_8cf9be64", "find_vendor"}, -- "Where can I find a vendor?"
	}
}
fern_yarrow_convo_template:addScreen(need_starship);

no_money = ConvoScreen:new {
	id = "no_money",
	leftDialog = "@conversation/greeter_dantooine_brother_imperial:s_688d1dd9", -- "Lack of funds is a common issue for new pilots. That is why so many pilots start out working for someone else. Ever think of joining the military to get a starship?"
	stopConversation = "false",
	options = {
		{"@conversation/greeter_dantooine_brother_imperial:s_12157feb", "free_ships"}, -- "The military gives out free ships?"
		{"@conversation/greeter_dantooine_brother_imperial:s_8b37a99a", "make_money"}, -- "How do I make money?"
	}
}
fern_yarrow_convo_template:addScreen(no_money);

free_ships = ConvoScreen:new {
	id = "free_ships",
	leftDialog = "@conversation/greeter_dantooine_brother_imperial:s_dfa28bfa", -- "Yeah, the Empire will supply new pilots with a ship. You can't exactly be an Imperial pilot without one. I've also heard rumors that the Alliance has ships they can provide for new recruits, but my brother, Kess, would know more about that."
	stopConversation = "false",
	options = {
		{"@conversation/greeter_dantooine_brother_imperial:s_acc368b1", "join_empire"}, -- "How do I join the Empire?"
		{"@conversation/greeter_dantooine_brother_imperial:s_21bf1a8c", "join_alliance"}, -- "How do I join the Alliance?"
		{"@conversation/greeter_dantooine_brother_imperial:s_68cb68ff", "join_neutral"}, -- "Is there anyone else I could fly for?"
	}
}
fern_yarrow_convo_template:addScreen(free_ships);

join_empire = ConvoScreen:new {
	id = "join_empire",
	leftDialog = "@conversation/greeter_dantooine_brother_imperial:s_558a361a", -- "The Imperial Navy? I've heard that they are sending out recruitment emails to everyone they can locate these days. Have you checked your email today?"
	stopConversation = "false",
	options = {
		{"@conversation/greeter_dantooine_brother_imperial:s_8515e448", "empire_mail"}, -- "Yes. I have an email from the Imperial Navy."
		{"@conversation/greeter_dantooine_brother_imperial:s_5618d2cd", "no_mail"}, -- "No. I have received no email."
		{"@conversation/greeter_dantooine_brother_imperial:s_52939a0", "how_to_mail"}, -- "How do I check my email?"
	}
}
fern_yarrow_convo_template:addScreen(join_empire);

no_mail = ConvoScreen:new {
	id = "no_mail",
	leftDialog = "@conversation/greeter_dantooine_brother_imperial:s_72f5c999", -- "I think that the majority of pilot trainers are registered with the planetary map. Try opening the planetary map with CTRL+V. On the right-hand side there is a listing of categories. Look under 'trainer' to find any local pilot teacher who's looking for pupils."

	stopConversation = "false",
	options = {
		{"@conversation/greeter_dantooine_brother_imperial:s_b9b27823", "anything_else"}, -- "Thank you."
	}
}
fern_yarrow_convo_template:addScreen(no_mail);

how_to_mail = ConvoScreen:new {
	id = "how_to_mail",
	leftDialog = "@conversation/greeter_dantooine_brother_imperial:s_e013f498", -- "Look for the flashing 'envelope' icon on your interface. It's placed on the lower right-hand side of your screen by default."
	stopConversation = "true",
	options = {}
}
fern_yarrow_convo_template:addScreen(how_to_mail);

empire_mail = ConvoScreen:new {
	id = "empire_mail",
	leftDialog = "@conversation/greeter_dantooine_brother_imperial:s_ef58210e", -- "Good, another Imperial pilot. Tell my stupid brother how it's much better flying for the Empire. Go on."
	stopConversation = "true",
	options = {}
}
fern_yarrow_convo_template:addScreen(empire_mail);

join_alliance = ConvoScreen:new {
	id = "join_alliance",
	leftDialog = "@conversation/greeter_dantooine_brother_imperial:s_97db14af", -- "Ask Kess. He's the current expert on the Alliance. And while you're at it, remind him he should quit and join the Empire with me.Was there anything else you wanted to ask?"
	stopConversation = "false",
	options = {
		{"@conversation/greeter_dantooine_brother_imperial:s_add31f19", "need_starship"}, -- "I need a starship."
		{"@conversation/greeter_dantooine_brother_imperial:s_8b23fac", "learn_to_fly"}, -- "I want to learn to fly."
		{"@conversation/greeter_dantooine_brother_imperial:s_cf5fc0f", "how_to_repair"}, --  "How do I repair my starship?"
	}
}
fern_yarrow_convo_template:addScreen(join_alliance);

join_neutral = ConvoScreen:new {
	id = "join_neutral",
	leftDialog = "@conversation/greeter_dantooine_brother_imperial:s_8634c132", -- "Too afraid to pick a side? You're just like my brother, Rane. On the other hand, at least I won't be fighting against Rane. Unlike my other brother, Kess, who is now a Rebel pilot."
	stopConversation = "true",
	options = {}
}
fern_yarrow_convo_template:addScreen(join_neutral);

learn_to_fly = ConvoScreen:new {
	id = "learn_to_fly",
	leftDialog = "@conversation/greeter_dantooine_brother_imperial:s_167bccd7", -- "Your best bet is to get in touch with the Empire and sign up for their training program. There are others who will urge you to put your efforts to use in the Alliance, but fools will be fools. Or they'll be my brother.Was there anything else you wanted to ask?"
	stopConversation = "false",
	options = {
		{"@conversation/greeter_dantooine_brother_imperial:s_acc368b1", "join_empire"}, -- "How do I join the Empire?"
		{"@conversation/greeter_dantooine_brother_imperial:s_21bf1a8c", "join_alliance"}, -- "How do I join the Alliance?"
		{"@conversation/greeter_dantooine_brother_imperial:s_68cb68ff", "join_neutral"}, -- "Is there anyone else I could fly for?"
	}
}
fern_yarrow_convo_template:addScreen(learn_to_fly);

how_to_repair = ConvoScreen:new {
	id = "how_to_repair",
	leftDialog = "@conversation/greeter_dantooine_brother_imperial:s_472f61d1", -- "Local space stations are the easiest way to get your ship repaired. When you are heading back here, you should stop at the space station and ask them for repairs. They will provide a quick estimate on what it will take to get you back on track."
	stopConversation = "false",
	options = {
		{"@conversation/greeter_dantooine_brother_imperial:s_270c87b2", "how_to_repair2"}, -- "How do I get them to repair my ship?"
	}
}
fern_yarrow_convo_template:addScreen(how_to_repair);

how_to_repair2 = ConvoScreen:new {
	id = "how_to_repair2",
	leftDialog = "@conversation/greeter_dantooine_brother_imperial:s_17bc5d9b", -- "When you approach the space station, use SHIFT+C to target it and open communication with the commander. You will be asked if you want to purchase repairs or if you want to land on the planet."
	stopConversation = "false",
	options = {
		{"@conversation/greeter_dantooine_brother_imperial:s_144ec5cc", "anything_else"}, -- "Sounds good. Thanks!"
	}
}
fern_yarrow_convo_template:addScreen(how_to_repair2);

find_vendor = ConvoScreen:new {
	id = "find_vendor",
	leftDialog = "@conversation/greeter_dantooine_brother_imperial:s_f3ec92a", -- "Use the planetary map to travel to the vendors listed on it, but not all vendors will be listed there. For the unlisted ones, you'll have to travel around looking for player-owned buildings that hold vendors. Once you've found a vendor, double-click it to see what it has for sale. You can also check bazaar terminals, but the listings on those will only be low-end starships and ship components, if even that."
	stopConversation = "false",
	options = {
		{"@conversation/greeter_dantooine_brother_imperial:s_b641cda6", "find_bazaar"}, -- "Where can I find a bazaar terminal?"
	}
}
fern_yarrow_convo_template:addScreen(find_vendor);

find_bazaar = ConvoScreen:new {
	id = "find_bazaar",
	leftDialog = "@conversation/greeter_dantooine_brother_imperial:s_ba95f774", -- "Bazaar terminals are located all over major cities. Check the areas surrounding major hot spots like the starport, the bank, any of the cantinas, or even the hospitals."
	stopConversation = "false",
	options = {
		{"@conversation/greeter_dantooine_brother_imperial:s_f2a4df5e", "anything_else"}, -- "Good idea! Thanks."
	}
}
fern_yarrow_convo_template:addScreen(find_bazaar);

make_money = ConvoScreen:new {
	id = "make_money",
	leftDialog = "@conversation/greeter_dantooine_brother_imperial:s_726e332f", -- "There are all sorts of civilian contracts available on the 'mission terminals' you find throughout town. Look for them near any major structure. Use the terminal to bring up the current list of local contracts. Choose the one that interests you the most, and you'll make money when the task is complete."
	stopConversation = "false",
	options = {
		{"@conversation/greeter_dantooine_brother_imperial:s_c4682ea6", "anything_else"}, -- "Thanks!"
	}
}
fern_yarrow_convo_template:addScreen(make_money);

--[[
"s_32146025", "Then what?"
"s_6d792b3f", "Double-click on the envelope icon, and read your mail! Anything else you wanted to ask?"
"s_c9e97ed5", "How else would I join up?"
"s_cb747ceb", "Hmm. Me neither. Maybe you should give it a little time?"
"s_df7992b9", "There are some freelance pilots here and there, though the Empire mostly frowns upon that kind of activity. At the same time, we do recognize that there is a need for a small number of freelance pilots to handle certain jobs with which the Empire does not want to be associated or simply views as beneath our notice. As I understand it, most freelance pilots are recruited through email."
"s_fd5402d8", "Ah! Then it should give you information about where to go to start your naval adventure. Good luck, my friend!"
]]

anything_else = ConvoScreen:new {
	id = "anything_else",
	leftDialog = "@conversation/greeter_dantooine_brother_imperial:s_aa5186b0", -- "Glad I could help. Was there anything else you wanted to ask?"
	stopConversation = "false",
	options = {
		{"@conversation/greeter_dantooine_brother_imperial:s_5ff8baab", "general_questions"}, -- "I was wondering if you could answer some questions?"
	}
}
fern_yarrow_convo_template:addScreen(anything_else);

addConversationTemplate("fern_yarrow_convo_template", fern_yarrow_convo_template);
