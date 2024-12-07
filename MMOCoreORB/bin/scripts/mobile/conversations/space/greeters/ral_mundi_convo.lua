ral_mundi_convo_template = ConvoTemplate:new {
	initialScreen = "",
	templateType = "Lua",
	luaClassHandler = "ralMundiConvoHandler",
	screens = {}
}

-- JTL is disabled

no_jtl = ConvoScreen:new {
	id = "no_jtl",
	leftDialog = "@conversation/greeter_coronet_merchant:s_198d9a41", -- Greetings and welcome to Coronet. I apologize, but I don't have time to chat right now. If you'll excuse me.
	stopConversation = "true",
	options = {}
}
ral_mundi_convo_template:addScreen(no_jtl);

-- Player is Rebel Pilot

rebel_pilot = ConvoScreen:new {
	id = "rebel_pilot",
	leftDialog = "@conversation/greeter_coronet_merchant:s_db064e66", -- "You have the look of a pilot from the Alliance. I'd better not find out you Rebels have stolen my shipment of goods."
	stopConversation = "true",
	options = {}
}
ral_mundi_convo_template:addScreen(rebel_pilot);

-- Player is Imperial Pilot

imperial_pilot = ConvoScreen:new {
	id = "imperial_pilot",
	leftDialog = "@conversation/greeter_coronet_merchant:s_e8b5b2ac", -- "Hello, sir. You're an Imperial Pilot, correct? Would you happen to know why my shipment might have been delayed? It's quite far behind schedule."
	stopConversation = "true",
	options = {}
}
ral_mundi_convo_template:addScreen(imperial_pilot);

-- Player is Neutral Pilot

neutral_pilot = ConvoScreen:new {
	id = "neutral_pilot",
	leftDialog = "@conversation/greeter_coronet_merchant:s_b78b7ed6", -- "Well, you're a pilot, and you've managed to land here, so that at least means starships are getting through to Corellia. But I still have no idea why my cargo has been delayed for so long."
	stopConversation = "true",
	options = {}
}
ral_mundi_convo_template:addScreen(neutral_pilot);

--[[

	Player is not a pilot

]]

not_pilot = ConvoScreen:new {
	id = "not_pilot",
	--leftDialog = "@conversation/greeter_coronet_merchant:s_198d9a41", -- "Greetings and welcome to Coronet. I apologize, but I don't have time to chat. If you get involved with space flight, I might be able to answer some questions, but otherwise I'm not going to be of much help."
	leftDialog = "@conversation/greeter_coronet_merchant:s_4a019574", -- "Greetings and welcome to Coronet. I apologize for my fading enthusiasm, but I've been waiting for quite some time for a shipment of goods to arrive. These two shipwrights have been waiting with me, and one of them is becoming especially belligerent."
	stopConversation = "false",
	options = {
		{"@conversation/greeter_coronet_merchant:s_add31f19", "need_starship"}, -- "I need a starship."
		{"@conversation/greeter_coronet_merchant:s_8b23fac", "learn_to_fly"}, -- "I want to learn to fly."
		{"@conversation/greeter_coronet_merchant:s_cf5fc0f", "how_to_repair"}, --  "How do I repair my starship?-
		{"@conversation/greeter_coronet_merchant:s_80e2ba26", "why_waiting"}, -- "Why are they waiting with you?"
	}
}
ral_mundi_convo_template:addScreen(not_pilot);

need_starship = ConvoScreen:new {
	id = "need_starship",
	leftDialog = "@conversation/greeter_coronet_merchant:s_495777c0", -- "Have you checked any vendors? Merchants use vendors to help sell their merchandise. Shipwrights put finished starships and ship components for sale on their vendors, and then you can go to those vendors and purchase what you need."
	stopConversation = "false",
	options = {
		{"@conversation/greeter_coronet_merchant:s_27186cee", "no_money"}, -- "I don't have enough money."
		{"@conversation/greeter_coronet_merchant:s_8cf9be64", "find_vendor"}, -- "Where can I find a vendor?"
		{"@conversation/greeter_coronet_merchant:s_93280d8a", "anything_else2"}, -- "Good idea. Thanks!"
	}
}
ral_mundi_convo_template:addScreen(need_starship);

learn_to_fly = ConvoScreen:new {
	id = "learn_to_fly",
	leftDialog = "@conversation/greeter_coronet_merchant:s_75698511", -- "Your best bet is to get in touch with the Empire and sign up for their training program. There are others who will urge you to put your efforts to use in the Alliance, but fools will be fools. Anything else?"
	stopConversation = "false",
	options = {
		{"@conversation/greeter_coronet_merchant:s_acc368b1", "join_empire"}, -- "How do I join the Empire?"
		{"@conversation/greeter_coronet_merchant:s_21bf1a8c", "join_alliance"}, -- "How do I join the Alliance?"
		{"@conversation/greeter_coronet_merchant:s_68cb68ff", "join_neutral"}, -- "Is there anyone else I could fly for?"
	}
}
ral_mundi_convo_template:addScreen(learn_to_fly);

how_to_repair = ConvoScreen:new {
	id = "how_to_repair",
	leftDialog = "@conversation/greeter_coronet_merchant:s_472f61d1", -- "Local space stations are the easiest way to get your ship repaired. When you are heading back here, you should stop at the space station and ask them for repairs. They will provide a quick estimate on what it will take to get you back on track."
	stopConversation = "false",
	options = {
		{"@conversation/greeter_coronet_merchant:s_270c87b2", "how_to_repair2"}, -- "How do I get them to repair my ship?"
	}
}
ral_mundi_convo_template:addScreen(how_to_repair);

how_to_repair2 = ConvoScreen:new {
	id = "how_to_repair2",
	leftDialog = "@conversation/greeter_coronet_merchant:s_17bc5d9b", -- "When you approach the space station, use SHIFT+C to target it and open communication with the commander. You will be asked if you want to purchase repairs or if you want to land on the planet."
	stopConversation = "false",
	options = {
		{"@conversation/greeter_coronet_merchant:s_144ec5cc", "anything_else3"}, -- "Sounds good. Thanks!"
	}
}
ral_mundi_convo_template:addScreen(how_to_repair2);

why_waiting = ConvoScreen:new {
	id = "why_waiting",
	leftDialog = "@conversation/greeter_coronet_merchant:s_82cd91e", -- "They ordered some parts from me, and those parts should be in the missing shipment. I gave them a good price, but the long wait seems to have eroded their goodwill."
	stopConversation = "false",
	options = {
		{"@conversation/greeter_coronet_merchant:s_d48167e1", "kind_words"}, -- "That's too bad. I hope your goods arrive soon."
	}
}
ral_mundi_convo_template:addScreen(why_waiting);

no_money = ConvoScreen:new {
	id = "no_money",
	leftDialog = "@conversation/greeter_coronet_merchant:s_a185791a", -- "Things are tough all over what with the Alliance and the Empire making with war and all. A lot of pilots are flying for either the Empire or the Rebellion these days. Ever think of joining the military to get a starship?"
	stopConversation = "false",
	options = {
		{"@conversation/greeter_coronet_merchant:s_12157feb", "free_ships"}, -- "The military gives out free ships?"
		{"@conversation/greeter_coronet_merchant:s_8b37a99a", "make_money"}, -- "How do I make money?"
	}
}
ral_mundi_convo_template:addScreen(no_money);

find_vendor = ConvoScreen:new {
	id = "find_vendor",
	leftDialog = "@conversation/greeter_coronet_merchant:s_f3ec92a", -- "Use the planetary map to travel to the vendors listed on it, but not all vendors will be listed there. For the unlisted ones, you'll have to travel around looking for player-owned buildings that hold vendors. Once you've found a vendor, double-click it to see what it has for sale. You can also check bazaar terminals, but the listings on those will only be low-end starships and ship components, if even that."
	stopConversation = "false",
	options = {
		{"@conversation/greeter_coronet_merchant:s_b641cda6", "find_bazaar"}, -- "Where can I find a bazaar terminal?"
	}
}
ral_mundi_convo_template:addScreen(find_vendor);

find_bazaar = ConvoScreen:new {
	id = "find_bazaar",
	leftDialog = "@conversation/greeter_coronet_merchant:s_ba95f774", -- "Bazaar terminals are located all over major cities. Check the areas surrounding major hot spots like the starport, the bank, any of the cantinas, or even the hospitals."
	stopConversation = "false",
	options = {
		{"@conversation/greeter_coronet_merchant:s_f2a4df5e", "anything_else4"}, -- "Good idea! Thanks."
	}
}
ral_mundi_convo_template:addScreen(find_bazaar);

free_ships = ConvoScreen:new {
	id = "free_ships",
	leftDialog = "@conversation/greeter_coronet_merchant:s_3c81054", -- "That's what I hear. The Empire's pretty well-equipped after all and can't really have much of a navy if their pilots don't have ships. I've also heard rumors that the Alliance has a fleet of ships available so they can get new recruits into the fray as soon as possible."
	stopConversation = "false",
	options = {
		{"@conversation/greeter_coronet_merchant:s_acc368b1", "join_empire"}, -- "How do I join the Empire?"
		{"@conversation/greeter_coronet_merchant:s_21bf1a8c", "join_alliance"}, -- "How do I join the Alliance?"
		{"@conversation/greeter_coronet_merchant:s_68cb68ff", "join_neutral"}, -- "Is there anyone else I could fly for?"
	}
}
ral_mundi_convo_template:addScreen(free_ships);

join_empire = ConvoScreen:new {
	id = "join_empire",
	leftDialog = "@conversation/greeter_coronet_merchant:s_558a361a", -- "The Imperial Navy? I've heard that they are sending out recruitment emails to everyone they can locate these days. Have you checked your email today?"
	stopConversation = "false",
	options = {
		{"@conversation/greeter_coronet_merchant:s_8515e448", "empire_mail"}, -- "Yes. I have an email from the Imperial Navy."
		{"@conversation/greeter_coronet_merchant:s_5618d2cd", "no_mail"}, -- "No. I have received no email."
		{"@conversation/greeter_coronet_merchant:s_52939a0", "how_to_mail"}, -- "How do I check my email?"
	}
}
ral_mundi_convo_template:addScreen(join_empire);

empire_mail = ConvoScreen:new {
	id = "empire_mail",
	leftDialog = "@conversation/greeter_coronet_merchant:s_fd5402d8", -- "Ah! Then it should give you information about where to go to start your naval adventure. Good luck, my friend!"
	stopConversation = "true",
	options = {}
}
ral_mundi_convo_template:addScreen(empire_mail);

join_alliance = ConvoScreen:new { -- This could be wrong
	id = "join_alliance",
	leftDialog = "@conversation/greeter_coronet_merchant:s_af4397a9", -- "Interesting. Well, good luck with that. I don't want to get too close to the Galactic Civil War, myself."
	stopConversation = "false",
	options = {
		{"@conversation/greeter_coronet_merchant:s_a9850aec", "alliance_mail"}, -- "I got an email from the Alliance!"
		{"@conversation/greeter_coronet_merchant:s_5618d2cd", "no_mail_rebel"}, -- "No. I have received no email."
		{"@conversation/greeter_coronet_merchant:s_52939a0", "how_to_mail"}, -- "How do I check my email?"
	}
}
ral_mundi_convo_template:addScreen(join_alliance);

alliance_mail = ConvoScreen:new {
	id = "alliance_mail",
	leftDialog = "@conversation/greeter_coronet_merchant:s_ba3c26af", -- "You did? These are desperate times, indeed. The email should probably indicate where you are supposed to go for initial recruitment."
	stopConversation = "false",
	options = {
		{"@conversation/greeter_coronet_merchant:s_32146025", "then_what"}, -- "Then what?"
	}
}
ral_mundi_convo_template:addScreen(alliance_mail);

then_what = ConvoScreen:new {
	id = "then_what",
	leftDialog = "@conversation/greeter_coronet_merchant:s_adc9d9e5", -- "Strange. Seems that if they undertook the risk to send you a message, they would make it clear how to respond. Why don't you check your email a little more carefully."
	stopConversation = "true",
	options = {}
}
ral_mundi_convo_template:addScreen(then_what);

join_neutral = ConvoScreen:new {
	id = "join_neutral",
	leftDialog = "@conversation/greeter_coronet_merchant:s_d9231b4f", -- "There are freelance pilots working in most systems. Some are CorSec pilots, others are part of the RSF of Naboo, and of course, others are smugglers or pirates. I wouldn't recommend those last two if you want to pursue a lengthy career, but, at the same time, some of the best military pilots I know were once smugglers. Most freelance organizations will send recruitment emails. You might try checking your email for something like that."
	stopConversation = "false",
	options = {
		{"Ok, I do see an email about Freelance Pilots.", "neutral_mail"}, -- ??
		{"@conversation/greeter_coronet_merchant:s_5618d2cd", "no_mail"}, -- "No. I have received no email."
		{"@conversation/greeter_coronet_merchant:s_52939a0", "how_to_mail"}, -- "How do I check my email?"
	}
}
ral_mundi_convo_template:addScreen(join_neutral);

neutral_mail = ConvoScreen:new {
	id = "neutral_mail",
	leftDialog = "@conversation/greeter_coronet_merchant:s_fd5402d8", -- "Ah! Then it should give you information about where to go to start your naval adventure. Good luck, my friend!"
	stopConversation = "true",
	options = {}
}
ral_mundi_convo_template:addScreen(neutral_mail);

how_to_mail = ConvoScreen:new {
	id = "how_to_mail",
	leftDialog = "@conversation/greeter_coronet_merchant:s_e013f498", -- "Look for the flashing 'envelope' icon on your interface. It's placed on the lower right-hand side of your screen by default."
	stopConversation = "true",
	options = {}
}
ral_mundi_convo_template:addScreen(how_to_mail);

kind_words = ConvoScreen:new {
	id = "kind_words",
	leftDialog = "@conversation/greeter_coronet_merchant:s_8ae971c3", -- Thank you for the kind words.
	stopConversation = "false",
	options = {
		{"@conversation/greeter_coronet_merchant:s_b5d34085", "main_questions"}, -- "Could I ask some questions while you wait?"
	}
}
ral_mundi_convo_template:addScreen(kind_words);

make_money = ConvoScreen:new {
	id = "make_money",
	leftDialog = "@conversation/greeter_coronet_merchant:s_726e332f", -- "There are all sorts of civilian contracts available on the 'mission terminals' you find throughout town. Look for them near any major structure. Use the terminal to bring up the current list of local contracts. Choose the one that interests you the most, and you'll make money when the task is complete."
	stopConversation = "false",
	options = {
		{"@conversation/greeter_coronet_merchant:s_c4682ea6", "anything_else5"}, -- "Thanks!"
	}
}
ral_mundi_convo_template:addScreen(make_money);

no_mail = ConvoScreen:new {
	id = "no_mail",
	leftDialog = "@conversation/greeter_coronet_merchant:s_9f7f7c0a", -- "I think that the majority of pilot trainers are registered with the planetary map. Try opening the planetary map with CTRL+V. On the right-hand side, there is a listing of categories. Look under 'trainer' to find any local pilot teacher who's looking for pupils."
	stopConversation = "false",
	options = {
		{"@conversation/greeter_coronet_merchant:s_b9b27823", "anything_else6"}, -- "Thank you."
	}
}
ral_mundi_convo_template:addScreen(no_mail);

no_mail_rebel = ConvoScreen:new {
	id = "no_mail_rebel",
	leftDialog = "@conversation/greeter_coronet_merchant:s_da08c873", -- "That's sort of tricky. There may be some Alliance pilots bold enough to register their locations on the planetary map. Have you looked at the planetary map yet?"
	stopConversation = "false",
	options = {
		{"@conversation/greeter_coronet_merchant:s_cdb17e79", "planet_map"}, -- "How do I check the planetary map?"
	}
}
ral_mundi_convo_template:addScreen(no_mail_rebel);

planet_map = ConvoScreen:new {
	id = "planet_map",
	leftDialog = "@conversation/greeter_coronet_merchant:s_e843e3ab", -- "Use the command CTRL+V to open the planetary map. On the right side of your display, you will see a listing of trainers by category. All local trainers who register with the planet will appear on this list. Click the 'Trainer' tab and then look for a pilot trainer."
	stopConversation = "false",
	options = {
		{"@conversation/greeter_coronet_merchant:s_3059f369", "planet_map_how"}, -- "What then?"
	}
}
ral_mundi_convo_template:addScreen(planet_map);

planet_map_how = ConvoScreen:new {
	id = "planet_map_how",
	leftDialog = "@conversation/greeter_coronet_merchant:s_5e410744", -- "Right-click on the map location to create and activate a waypoint. Follow the waypoint to the trainer's location."
	stopConversation = "false",
	options = {
		{"@conversation/greeter_coronet_merchant:s_f90ad503", "anything_else1"}, -- "I see. Thanks!"
	}
}
ral_mundi_convo_template:addScreen(planet_map_how);

main_questions = ConvoScreen:new {
	id = "main_questions",
	leftDialog = "@conversation/greeter_coronet_merchant:s_659f0dee", -- "Seeing as I have little else to do at the moment, ask away."
	stopConversation = "false",
	options = {
		{"@conversation/greeter_coronet_merchant:s_add31f19", "need_starship"}, -- "I need a starship."
		{"@conversation/greeter_coronet_merchant:s_8b23fac", "learn_to_fly"}, -- "I want to learn to fly."
		{"@conversation/greeter_coronet_merchant:s_cf5fc0f", "how_to_repair"}, --  "How do I repair my starship?
		{"@conversation/greeter_coronet_merchant:s_80e2ba26", "why_waiting"}, -- "Why are they waiting with you?"
	}
}
ral_mundi_convo_template:addScreen(main_questions);

ask_away = ConvoScreen:new {
	id = "ask_away",
	leftDialog = "@conversation/greeter_coronet_merchant:s_8dd808e3", -- "Ask away."
	stopConversation = "false",
	options = {
		{"@conversation/greeter_coronet_merchant:s_add31f19", "need_starship"}, -- "I need a starship."
		{"@conversation/greeter_coronet_merchant:s_8b23fac", "learn_to_fly"}, -- "I want to learn to fly."
		{"@conversation/greeter_coronet_merchant:s_cf5fc0f", "how_to_repair"}, --  "How do I repair my starship?
		{"@conversation/greeter_coronet_merchant:s_80e2ba26", "why_waiting"}, -- "Why are they waiting with you?"
	}
}
ral_mundi_convo_template:addScreen(ask_away);

anything_else1 = ConvoScreen:new {
	id = "anything_else1",
	leftDialog = "@conversation/greeter_coronet_merchant:s_a463a3c1", -- "You're welcome. Anything else?"
	stopConversation = "false",
	options = {
		{"@conversation/greeter_coronet_merchant:s_5ff8baab", "main_questions"}, -- "I was wondering if you could answer some questions?"
	}
}
ral_mundi_convo_template:addScreen(anything_else1);

anything_else2 = ConvoScreen:new {
	id = "anything_else2",
	leftDialog = "@conversation/greeter_coronet_merchant:s_cc7c9754", -- "Don't mention it. Anything else?"
	stopConversation = "false",
	options = {
		{"@conversation/greeter_coronet_merchant:s_8ef8dbfb", "ask_away"}, -- "I have another question."
	}
}
ral_mundi_convo_template:addScreen(anything_else2);

anything_else3 = ConvoScreen:new {
	id = "anything_else3",
	leftDialog = "@conversation/greeter_coronet_merchant:s_fbc4f153", -- "Hey, my pleasure. As long as I'm not busy. Anything else?"
	stopConversation = "false",
	options = {
		{"@conversation/greeter_coronet_merchant:s_5ff8baab", "main_questions"}, -- "I was wondering if you could answer some questions?"
	}
}
ral_mundi_convo_template:addScreen(anything_else3);

anything_else4 = ConvoScreen:new {
	id = "anything_else4",
	leftDialog = "@conversation/greeter_coronet_merchant:s_f5f72ae1", -- "My pleasure. Anything else?"
	stopConversation = "false",
	options = {
		{"@conversation/greeter_coronet_merchant:s_8ef8dbfb", "ask_away"}, -- "I have another question."
	}
}
ral_mundi_convo_template:addScreen(anything_else4);

anything_else5 = ConvoScreen:new {
	id = "anything_else5",
	leftDialog = "@conversation/greeter_coronet_merchant:s_d4c6e8cd", -- "No problem! Anything else?"
	stopConversation = "false",
	options = {
		{"@conversation/greeter_coronet_merchant:s_5ff8baab", "main_questions"}, -- "I was wondering if you could answer some questions?"
	}
}
ral_mundi_convo_template:addScreen(anything_else5);

anything_else6 = ConvoScreen:new {
	id = "anything_else6",
	leftDialog = "@conversation/greeter_coronet_merchant:s_4eb2ac5d", -- "Good luck, kid! Anything else?"
	stopConversation = "false",
	options = {
		{"@conversation/greeter_coronet_merchant:s_8ef8dbfb", "ask_away"}, -- "I have another question."
	}
}
ral_mundi_convo_template:addScreen(anything_else6);

anything_else7 = ConvoScreen:new {
	id = "anything_else7",
	leftDialog = "@conversation/greeter_coronet_merchant:s_50095b25", -- "Not a problem. Anything else?"
	stopConversation = "false",
	options = {
		{"@conversation/greeter_coronet_merchant:s_5ff8baab", "ask_away"}, -- "I was wondering if you could answer some questions?"
	}
}
ral_mundi_convo_template:addScreen(anything_else7);

--[[ Unknown / Unused

"s_309c383a", "On the lower right-hand side of your screen, there should be a 'letter' icon that is flashing. Double-click on this icon, and it will bring up your personal email. Read over the subject and sender, and scroll through the body text to get all the details."
"s_6f0ab63b", "Stay safe, my friend."
"s_e1c13ebb", "Double-click on the envelope icon, and read your mail! Anything else?"

-- Player Responses

"s_5b893f7c", "It does."
"s_1a06c1df", "It doesn't."
"s_29894b97", "I don't know how to check."
"s_c9e97ed5", "How else would I join up?"
"s_cb747ceb", "Hmm. Me neither. Maybe you should give it a little time?"
]]

--[[

	Conversation Enders

]]

goodbye = ConvoScreen:new {
	id = "goodbye",
	leftDialog = "@conversation/greeter_coronet_merchant:s_c2db6878", -- "Good-bye."
	stopConversation = "true",
	options = {}
}
ral_mundi_convo_template:addScreen(goodbye);

addConversationTemplate("ral_mundi_convo_template", ral_mundi_convo_template);
