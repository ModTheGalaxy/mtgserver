-- Run from MMOCoreORB/bin with: lua ../src/tests/JediProgressionTest.lua
local objects, transient, events, errors = {}, {}, {}, {}
local now, nextId = 1000, 10000
os.time = function() return now end

ScreenPlay = {}
function ScreenPlay:new(value)
	return setmetatable(value, { __index = self })
end

local Entity = {}
Entity.__index = Entity
function Entity:getObjectID() return self.id end
function Entity:getZoneName() return self.zone end
function Entity:getWorldPositionX() return self.x end
function Entity:getWorldPositionY() return self.y end
function Entity:getParentID() return 0 end
function Entity:isPlayerCreature() return self.player == true end
function Entity:isDead() return false end
function Entity:isIncapacitated() return false end
function Entity:isInCombat() return self.inCombat == true end
function Entity:getPlayerObject() return self.ghost end
function Entity:getFirstName() return "Test" end
function Entity:getCustomObjectName() return self.name or "Test" end
function Entity:getJediState() return self.jediState or 0 end
function Entity:setJediState(value) self.jediState = value end
function Entity:hasSkill(name) return self.skills[name] == true end
function Entity:hasBadge(id) return self.badges[id] == true end
function Entity:isOnline() return true end
function Entity:hasScreenPlayState(mask, name) return ((self.states[name] or 0) & mask) ~= 0 end
function Entity:getScreenPlayState(name) return self.states[name] or 0 end
function Entity:setScreenPlayState(mask, name) self.states[name] = (self.states[name] or 0) | mask end
function Entity:removeScreenPlayState(mask, name) self.states[name] = (self.states[name] or 0) & (~mask) end
function Entity:sendSystemMessage(message) table.insert(self.messages, message) end
function Entity:setPvpStatusBitmask() end
function Entity:clearOptionBit() end
function Entity:playEffect() end
function Entity:playMusicMessage() end
function Entity:getSlottedObject(name) return name == "inventory" and self.inventory or nil end
function Entity:destroyObjectFromWorld() objects[self.id] = nil end
function Entity:destroyObjectFromDatabase() self.destroyed = true end
function Entity:isContainerFullRecursive() return false end
function Entity:removeWaypointBySpecialType() end
function Entity:getDistanceTo(other)
	return math.sqrt((self.x - other.x)^2 + (self.y - other.y)^2)
end
function Entity:isInRangeWithObject(other, range)
	return self.zone == other.zone and ((self.x - other.x)^2 + (self.y - other.y)^2) <= range^2
end
function Entity:addWaypoint(zone, name, _, x, _, y)
	local waypoint = newEntity({ zone = zone, x = x, y = y, name = name })
	self.waypoints[waypoint.id] = waypoint
	return waypoint.id
end
function Entity:getWaypointAt(x, y, zone)
	for _, waypoint in pairs(self.waypoints) do
		if (waypoint.x == x and waypoint.y == y and waypoint.zone == zone) then
			return waypoint
		end
	end
end
function Entity:removeWaypoint(id) self.waypoints[id] = nil end
function Entity:getFrsCouncil() return self.council or 0 end
function Entity:setFrsCouncil(value) self.council = value end
function Entity:setFrsRank(value) self.frsRank = value end
function Entity:setFaction(value) self.faction = value end
function Entity:setFactionStatus(value) self.factionStatus = value end

function newEntity(values)
	nextId = nextId + 1
	values.id = values.id or nextId
	values.zone, values.x, values.y = values.zone or "naboo", values.x or 0, values.y or 0
	values.skills, values.badges, values.states = values.skills or {}, values.badges or {}, values.states or {}
	values.data, values.messages, values.waypoints = {}, {}, {}
	objects[values.id] = setmetatable(values, Entity)
	return values
end

local function newPlayer()
	local player = newEntity({ player = true, x = 200 })
	player.ghost = player
	return player
end

function SceneObject(value) return value end
function CreatureObject(value) return value end
function PlayerObject(value) return value end
function getSceneObject(id) return objects[id] end
function readData(key) return transient[key] or 0 end
function writeData(key, value) transient[key] = value end
function deleteData(key) transient[key] = nil end
function readScreenPlayData(player, namespace, key) return player.data[namespace .. ":" .. key] or "" end
function writeScreenPlayData(player, namespace, key, value) player.data[namespace .. ":" .. key] = tostring(value) end
function deleteScreenPlayData(player, namespace, key) player.data[namespace .. ":" .. key] = nil end
function isZoneEnabled(zone) return zone == "naboo" end
function getRandomNumber(minimum) return minimum end
function getBadgeListByType(kind)
	assert(kind == "exploration_jedi")
	return { 1, 2, 3, 4 }
end
function printLuaError(message) table.insert(errors, message) end
function createObserver() end
function dropObserver() end
function createEvent(_, name, method, player, arg)
	table.insert(events, { name = name, method = method, player = player, arg = arg })
end
function spawnActiveArea(zone, _, x, _, y)
	return newEntity({ zone = zone, x = x, y = y })
end
function getSpawnPoint(_, x, y) return { x + 3, 0, y } end
function sendMail() end
function playClientEffectLoc() end

ENTEREDAREA, BADGEAWARDED, LOGGEDIN, LOGGEDOUT = 1, 2, 3, 4
WAYPOINT_YELLOW, FACTIONREBEL, FACTIONIMPERIAL = 1, 2, 3
VILLAGE_JEDI_PROGRESSION_GLOWING = 1
VILLAGE_JEDI_PROGRESSION_HAS_CRYSTAL = 2
VILLAGE_JEDI_PROGRESSION_COMPLETED_VILLAGE = 8
VILLAGE_JEDI_PROGRESSION_DEFEATED_MELLIACHAE = 32

local quests = {
	OLD_MAN_INITIAL = "initial",
	OLD_MAN_FORCE_CRYSTAL = "crystal",
	OLD_MAN_FINAL = "final",
	FS_VILLAGE_ELDER = "elder",
	FS_THEATER_FINAL = "theater_final",
	GOT_DATAPAD_2 = "got_datapad_2",
	LOOT_DATAPAD_2 = "loot_datapad_2",
}
local questManager = { quests = quests }
function questManager.hasCompletedQuest(player, quest) return player.completed and player.completed[quest] or false end
function questManager.hasActiveQuest() return false end
function questManager.resetQuest() end
function questManager.activateQuest() end
function questManager.completeQuest(player, quest)
	player.completed = player.completed or {}
	player.completed[quest] = true
end
package.preload["managers.quest.quest_manager"] = function() return questManager end
package.preload["managers.object.object_manager"] = function() return {} end
package.preload["utils.logger"] = function() return { log = function() end } end

local SpawnMobiles, spawns = {}, {}
function SpawnMobiles.isPrefixFree(player, prefix) return spawns[player.id .. prefix] == nil end
function SpawnMobiles.isValidMobile(mobile) return mobile ~= nil end
function SpawnMobiles.getSpawnedMobiles(player, prefix)
	local mobile = spawns[player.id .. prefix]
	return mobile ~= nil and { mobile } or nil
end
function SpawnMobiles.generateMobileObjects(player, prefix, _, points)
	local mobile = newEntity({ zone = player.zone, x = points[1][1], y = points[1][3] })
	spawns[player.id .. prefix] = mobile
	return { mobile }
end
function SpawnMobiles.despawnMobiles(player, prefix)
	local mobile = spawns[player.id .. prefix]
	if (mobile ~= nil) then objects[mobile.id] = nil end
	spawns[player.id .. prefix] = nil
end
package.preload["utils.spawn_mobiles"] = function() return SpawnMobiles end

local function encounter(name)
	return {
		taskName = name,
		spawnObjectList = { { template = "old_man" } },
		hasTaskStarted = function() return false end,
		onEncounterInRange = function(_, player)
			if (name == "OldManIntroEncounter") then FsIntro:setCurrentStep(player, 2)
			else FsOutro:setCurrentStep(player, 2) end
		end,
	}
end
OldManIntroEncounter = encounter("OldManIntroEncounter")
OldManOutroEncounter = encounter("OldManOutroEncounter")
function OldManIntroEncounter:hasForceCrystal(player) return player.hasCrystal == true end
VillageJediManagerCommon = {}
function VillageJediManagerCommon.hasJediProgressionScreenPlayState(player, state)
	return player:hasScreenPlayState(state, "VillageJediProgression")
end
function VillageJediManagerCommon.setJediProgressionScreenPlayState(player, state)
	player:setScreenPlayState(state, "VillageJediProgression")
end

local failedSkill, throwingSkill
function awardSkill(player, skill)
	if (skill == throwingSkill) then error("simulated award failure") end
	if (skill ~= failedSkill) then player.skills[skill] = true end
end
SuiMessageBox = {
	new = function()
		return setmetatable({}, { __index = function() return function() end end })
	end,
}
KnightTrials = { onPlayerLoggedIn = function() end }
PadawanTrials = { doPadawanTrialsSetup = function(_, player) player.setupCount = (player.setupCount or 0) + 1 end }
GoToDathomir = { finish = function() end }
MellichaeOutroTheater = {
	hasTaskStarted = function(_, player) return player.campActive == true end,
	finish = function(_, player) player.campActive = false end,
}
dofile("scripts/screenplays/village/outro/fs_outro.lua")
FsIntro = {
	OLDMANWAIT = 1, OLDMANMEET = 2, SITHWAIT = 3, USEDATAPADTWO = 7, VILLAGE = 8,
	getCurrentStep = function(_, player) return player.introStep or 1 end,
	setCurrentStep = function(_, player, step) player.introStep = step end,
	isOnIntro = function(_, player) return player:hasScreenPlayState(1, "VillageJediProgression") end,
}

dofile("scripts/screenplays/jedi/trialData.lua")
dofile("scripts/screenplays/jedi/jedi_trials.lua")
local function completeTasks(player)
	writeScreenPlayData(player, "PadawanTrials", "startedTrials", 1)
	writeScreenPlayData(player, "PadawanTrials", "trialsCompleted", #padawanTrialQuests)
	writeScreenPlayData(player, "JediTrials", "currentTrial", 0)
end
JediTrials.shrinePlanets = { "naboo" }
JediTrials.forceShrineIds = { naboo = { 101, 102 } }
newEntity({ id = 101, x = 0 })
newEntity({ id = 102, x = 500 })
dofile("scripts/screenplays/jedi/shrine_old_man.lua")
dofile("scripts/screenplays/village/intro/glowing.lua")
function FsIntro:startPlayerOnIntro(player) JediShrineProgression:startIntro(player) end

local player = newPlayer()
player.badges[1], player.badges[2] = true, true
Glowing:onPlayerLoggedIn(player)
assert(not player:hasScreenPlayState(1, "VillageJediProgression"))
player.badges[3] = true
Glowing:badgeAwardedEventHandler(player)
assert(player:hasScreenPlayState(1, "VillageJediProgression"))
assert(readScreenPlayData(player, "JediShrineProgression", "introShrineId") == "101")
assert(next(player.waypoints) ~= nil)

local area = getSceneObject(readData(player.id .. ":shrineOldMan:intro:area"))
local stranger = newPlayer()
JediShrineProgression:onEnteredArea(area, stranger)
assert(readData(stranger.id .. ":shrineOldMan:intro:mobile") == 0)
player.x = 33
JediShrineProgression:onEnteredArea(area, player)
assert(readData(player.id .. ":shrineOldMan:intro:mobile") == 0)
player.x = 32
JediShrineProgression:onEnteredArea(area, player)
local mobileId = readData(player.id .. ":shrineOldMan:intro:mobile")
assert(mobileId ~= 0 and player.introStep == 2)
JediShrineProgression:onEnteredArea(area, player)
assert(readData(player.id .. ":shrineOldMan:intro:mobile") == mobileId)

player.x = 100
JediShrineProgression:checkMeeting(player, "intro:" .. mobileId)
assert(readData(player.id .. ":shrineOldMan:intro:mobile") == 0 and player.introStep == 1)
player.x = 0
JediShrineProgression:onEnteredArea(area, player)
assert(readData(player.id .. ":shrineOldMan:intro:mobile") == 0)
now = now + 300
JediShrineProgression:onEnteredArea(area, player)
mobileId = readData(player.id .. ":shrineOldMan:intro:mobile")
assert(mobileId ~= 0)
JediShrineProgression:finishMeeting(player, "intro", true)
player.introStep = 3
player.x = 100
JediShrineProgression:checkMeeting(player, "intro:" .. mobileId)
assert(player.introStep == 3)
JediShrineProgression:finishDespawn(player, "intro:" .. mobileId .. ":1")
assert(readData(player.id .. ":shrineOldMan:intro:mobile") == 0)
assert(not JediShrineProgression:startOutro(player))
completeTasks(player)
assert(JediShrineProgression:startOutro(player))
assert(readScreenPlayData(player, "JediShrineProgression", "outroShrineId") == "102")

local boundary = newPlayer()
boundary.x = 0
boundary.inCombat = true
assert(JediShrineProgression:startIntro(boundary))
local boundaryMobile = readData(boundary.id .. ":shrineOldMan:intro:mobile")
assert(boundaryMobile ~= 0)
boundary.x = 67
JediShrineProgression:checkMeeting(boundary, "intro:" .. boundaryMobile)
assert(readData(boundary.id .. ":shrineOldMan:intro:mobile") == boundaryMobile)
boundary.x = 68
JediShrineProgression:checkMeeting(boundary, "intro:" .. boundaryMobile)
assert(readData(boundary.id .. ":shrineOldMan:intro:mobile") == 0)
JediShrineProgression:onLoggedOut(boundary)
boundary.x = 0
assert(JediShrineProgression:prepareMeeting(boundary, "intro"))
assert(readData(boundary.id .. ":shrineOldMan:intro:mobile") == 0)
now = now + 300
JediShrineProgression:onEnteredArea(getSceneObject(readData(boundary.id .. ":shrineOldMan:intro:area")), boundary)
local replacement = readData(boundary.id .. ":shrineOldMan:intro:mobile")
assert(replacement ~= 0 and replacement ~= boundaryMobile)
JediShrineProgression:checkMeeting(boundary, "intro:" .. boundaryMobile)
assert(readData(boundary.id .. ":shrineOldMan:intro:mobile") == replacement)
now = now + 300
JediShrineProgression:checkMeeting(boundary, "intro:" .. replacement)
assert(readData(boundary.id .. ":shrineOldMan:intro:mobile") == 0)

local unavailable = newPlayer()
completeTasks(unavailable)
writeScreenPlayData(unavailable, "JediShrineProgression", "introShrineId", 101)
local secondShrine = objects[102]
objects[102] = nil
assert(not JediShrineProgression:startOutro(unavailable))
objects[102] = secondShrine
assert(JediShrineProgression:prepareMeeting(unavailable, "outro"))
assert(readScreenPlayData(unavailable, "JediShrineProgression", "outroShrineId") == "102")

local legacy = newPlayer()
legacy:setScreenPlayState(8, "VillageJediProgression")
assert(JediShrineProgression:onLoggedIn(legacy))
assert(legacy:hasSkill("force_title_jedi_novice") and legacy:getJediState() == 1)
assert(legacy:hasScreenPlayState(4, "JediShrineProgression") and legacy.setupCount == 1)
assert(JediTrials:isEligibleForPadawanTrials(legacy))
assert(JediShrineProgression:onLoggedIn(legacy) and legacy.setupCount == 1)

local legacyOutro = newPlayer()
legacyOutro:setScreenPlayState(2, "JediShrineProgression")
legacyOutro.campActive = true
FsOutro:setCurrentStep(legacyOutro, FsOutro.MELLICHAETHEATER)
local legacyWaypoint = legacyOutro:addWaypoint("naboo", "Old Man", "", 500, 0, 0)
writeScreenPlayData(legacyOutro, "JediShrineProgression", "outroWaypointId", legacyWaypoint)
writeScreenPlayData(legacyOutro, "JediShrineProgression", "outroShrineId", 102)
assert(JediShrineProgression:onLoggedIn(legacyOutro))
assert(not legacyOutro.campActive and legacyOutro.waypoints[legacyWaypoint] == nil)
assert(not legacyOutro:hasScreenPlayState(2, "JediShrineProgression"))
assert(legacyOutro:hasScreenPlayState(8, "JediShrineProgression"))
assert(legacyOutro.setupCount == 1 and JediTrials:isEligibleForPadawanTrials(legacyOutro))
assert(readScreenPlayData(legacyOutro, "JediShrineProgression", "outroShrineId") == "102")
assert(JediShrineProgression:onLoggedIn(legacyOutro) and legacyOutro.setupCount == 1)

local legacyAccess = newPlayer()
questManager.completeQuest(legacyAccess, quests.FS_VILLAGE_ELDER)
assert(JediShrineProgression:onLoggedIn(legacyAccess))
assert(legacyAccess.setupCount == 1 and JediTrials:isEligibleForPadawanTrials(legacyAccess))
assert(not FsOutro:isOnOutro(legacyAccess))

local ranked = newPlayer()
ranked.skills.force_title_jedi_rank_02 = true
ranked.skills.force_title_jedi_rank_03 = true
ranked:setJediState(8)
assert(JediShrineProgression:onLoggedIn(ranked))
assert(ranked:getJediState() == 8 and ranked:hasSkill("force_title_jedi_rank_03") and ranked.setupCount == nil)

local migrated = newPlayer()
migrated:setScreenPlayState(1, "VillageJediProgression")
migrated.introStep, migrated.hasCrystal = 5, true
assert(JediShrineProgression:onLoggedIn(migrated))
assert(migrated.hasCrystal and migrated.introStep == 5 and migrated:hasSkill("force_title_jedi_novice"))

local failing = newPlayer()
completeTasks(failing)
failing:setScreenPlayState(32, "VillageJediProgression")
throwingSkill = "force_title_jedi_rank_01"
assert(not pcall(JediTrials.awardPadawanRankOne, JediTrials, failing))
assert(readData(failing.id .. ":padawanTrialRankAward") == 0)
throwingSkill = nil
failedSkill = "force_title_jedi_rank_01"
JediTrials:unlockJediPadawan(failing, true)
assert(readScreenPlayData(failing, "PadawanTrials", "completedTrials") == "" and failing:getJediState() == 0)
assert(readData(failing.id .. ":padawanTrialRankAward") == 0)
failedSkill = "force_title_jedi_rank_02"
JediTrials:unlockJediPadawan(failing, true)
assert(failing:hasSkill("force_title_jedi_rank_01"))
assert(readScreenPlayData(failing, "PadawanTrials", "completedTrials") == "" and failing:getJediState() == 0)
failedSkill = nil
JediTrials:unlockJediPadawan(failing, true)
assert(failing:hasSkill("force_title_jedi_rank_02") and failing:getJediState() == 2)
assert(readScreenPlayData(failing, "PadawanTrials", "completedTrials") == "1")

local knight = newPlayer()
writeScreenPlayData(knight, "JediTrials", "JediCouncil", 1)
failedSkill = "force_title_jedi_rank_03"
JediTrials:unlockJediKnight(knight)
assert(readScreenPlayData(knight, "KnightTrials", "completedTrials") == "")
assert(knight:getJediState() == 0 and knight.council == nil and knight.faction == nil)

Encounter = ScreenPlay
local legacyRangeChecks = 0
function Encounter:handleEncounterInRangeCheck() legacyRangeChecks = legacyRangeChecks + 1 end
Logger = { log = function() end }
LT_INFO = 1
local itemsGiven = 0
local robesGiven = 0
function giveItem(inventory, template)
	itemsGiven = itemsGiven + 1
	if (template == "object/tangible/wearables/robe/robe_jedi_padawan.iff") then
		robesGiven = robesGiven + 1
	end
	return newEntity({ zone = inventory.zone })
end
dofile("scripts/screenplays/village/intro/old_man_intro_encounter.lua")
dofile("scripts/screenplays/village/intro/fs_intro.lua")

local recovering = newPlayer()
recovering.inventory = newEntity({})
recovering:setScreenPlayState(1, "VillageJediProgression")
recovering:setScreenPlayState(1, "JediShrineProgression")
FsIntro:setCurrentStep(recovering, FsIntro.OLDMANMEET)
failedSkill = "force_title_jedi_novice"
assert(not OldManIntroEncounter:giveForceCrystalToPlayer(recovering))
assert(OldManIntroEncounter:hasForceCrystal(recovering))
assert(not questManager.hasCompletedQuest(recovering, quests.OLD_MAN_FORCE_CRYSTAL))
FsIntro:onLoggedIn(recovering)
assert(FsIntro:getCurrentStep(recovering) == FsIntro.OLDMANMEET)
failedSkill = nil
FsIntro:onLoggedIn(recovering)
assert(itemsGiven == 1 and recovering:hasSkill("force_title_jedi_novice"))
assert(questManager.hasCompletedQuest(recovering, quests.OLD_MAN_INITIAL))
assert(questManager.hasCompletedQuest(recovering, quests.OLD_MAN_FORCE_CRYSTAL))
assert(FsIntro:getCurrentStep(recovering) == FsIntro.SITHWAIT)
assert(tonumber(readScreenPlayData(recovering, "VillageJediProgression", "FsIntroDelay")) > now)

function OldManIntroEncounter:hasTaskStarted() return false end
dofile("scripts/screenplays/village/outro/old_man_outro_encounter.lua")
function OldManOutroEncounter:hasTaskStarted() return false end
conv_handler = ScreenPlay
function LuaConversationTemplate(value) return value end
function LuaConversationScreen(value) return value end
function LuaStringIdChatParameter()
	return { setTT = function() end, _getObject = function() end }
end
function spatialChat() end
dofile("scripts/screenplays/village/convos/intro/old_man_conv_handler.lua")

local meeting = newPlayer()
meeting.inventory = newEntity({})
meeting.x = 0
meeting:setScreenPlayState(1, "VillageJediProgression")
assert(JediShrineProgression:startIntro(meeting))
local oldMan = getSceneObject(readData(meeting.id .. ":shrineOldMan:intro:mobile"))
local template = { getScreen = function(_, name) return name end }
assert(oldManIntroConvoHandler:getInitialScreen(stranger, oldMan, template) == "nothing_to_discuss")
assert(oldManIntroConvoHandler:getInitialScreen(meeting, oldMan, template) == "intro")
local screen = { getScreenID = function() return "here_is_the_crystal" end }
oldManIntroConvoHandler:runScreenHandlers(template, meeting, oldMan, 0, screen)
assert(meeting:hasSkill("force_title_jedi_novice"))
assert(questManager.hasCompletedQuest(meeting, quests.OLD_MAN_FORCE_CRYSTAL))
assert(FsIntro:getCurrentStep(meeting) == FsIntro.SITHWAIT)

meeting.x = 500
assert(not JediShrineProgression:startOutro(meeting))
completeTasks(meeting)
assert(JediShrineProgression:startOutro(meeting))
oldMan = getSceneObject(readData(meeting.id .. ":shrineOldMan:outro:mobile"))
OldManIntroEncounter:handleEncounterInRangeCheck(meeting)
OldManOutroEncounter:handleEncounterInRangeCheck(meeting)
assert(legacyRangeChecks == 0)
OldManIntroEncounter:handleEncounterInRangeCheck(stranger)
OldManOutroEncounter:handleEncounterInRangeCheck(stranger)
assert(legacyRangeChecks == 2)
assert(oldManIntroConvoHandler:getInitialScreen(stranger, oldMan, template) == "nothing_to_discuss")
assert(oldManIntroConvoHandler:getInitialScreen(meeting, oldMan, template) == "intro_mellichae")
local introScreen = {
	getScreenID = function() return "intro_mellichae" end,
	cloneScreen = function()
		return { setCustomDialogText = function(self, text) self.text = text end }
	end,
}
local displayed = oldManIntroConvoHandler:runScreenHandlers(template, meeting, oldMan, 0, introScreen)
assert(displayed.text ~= nil and not string.find(displayed.text, "village"))
local theaterStarted = false
MellichaeOutroTheater = {
	hasTaskStarted = function() return false end,
	start = function(_, pPlayer) theaterStarted = pPlayer == meeting return true end,
}
screen = { getScreenID = function() return "where_camp" end }
local startCamp = MellichaeOutroTheater.start
MellichaeOutroTheater.start = function() return false end
oldManIntroConvoHandler:runScreenHandlers(template, meeting, oldMan, 0, screen)
assert(FsOutro:getCurrentStep(meeting) == FsOutro.OLDMANMEET)
assert(not questManager.hasCompletedQuest(meeting, quests.OLD_MAN_FINAL))
MellichaeOutroTheater.start = startCamp
oldManIntroConvoHandler:runScreenHandlers(template, meeting, oldMan, 0, screen)
assert(FsOutro:getCurrentStep(meeting) == 3 and theaterStarted)
assert(questManager.hasCompletedQuest(meeting, quests.OLD_MAN_FINAL))

package.preload["utils.helpers"] = function() return {} end
OBJECTDESTRUCTION, EXITEDAREA = 5, 6
dofile("scripts/screenplays/quest_tasks/task.lua")
dofile("scripts/screenplays/quest_tasks/go_to_theater.lua")
dofile("scripts/screenplays/village/outro/mellichae_outro_theater.lua")
local theater = newEntity({})
function MellichaeOutroTheater:getTheaterObject() return theater end
local function defeatMellichae(owner)
	local mellichae = newEntity({})
	writeData(mellichae.id .. "questOwner", owner.id)
	MellichaeOutroTheater:onMellichaeKilled(mellichae, owner)
end
local alreadyPadawan = newPlayer()
alreadyPadawan.skills.force_title_jedi_rank_02 = true
defeatMellichae(alreadyPadawan)
assert(alreadyPadawan.setupCount == nil)
local activeTrial = newPlayer()
writeScreenPlayData(activeTrial, "PadawanTrials", "startedTrials", 1)
defeatMellichae(activeTrial)
assert(activeTrial.setupCount == nil)
assert(not activeTrial:hasScreenPlayState(32, "VillageJediProgression"))
local newRoute = newPlayer()
completeTasks(newRoute)
defeatMellichae(newRoute)
assert(newRoute:hasSkill("force_title_jedi_rank_02") and newRoute:getJediState() == 2)
assert(readScreenPlayData(newRoute, "PadawanTrials", "completedTrials") == "1")

dofile("scripts/screenplays/jedi/padawan/padawan_trials.lua")
dofile("scripts/screenplays/village/intro/sith_shadow_intro_theater.lua")
dofile("scripts/screenplays/jedi/components/ForceShrineMenuComponent.lua")
local candidate = newPlayer()
candidate.inventory = newEntity({})
candidate.skills.force_title_jedi_novice = true
candidate:setJediState(1)
candidate:setScreenPlayState(1, "VillageJediProgression")
writeScreenPlayData(candidate, "JediShrineProgression", "introShrineId", 101)
questManager.completeQuest(candidate, quests.GOT_DATAPAD_2)
local datapad = newEntity({})
SithShadowIntroTheater:useTheaterDatapad(datapad, candidate)
assert(datapad.destroyed and JediTrials:isEligibleForPadawanTrials(candidate))
assert(not FsIntro:isOnIntro(candidate) and not FsOutro:isOnOutro(candidate))
assert(candidate:getJediState() == 1 and not candidate:hasSkill("force_title_jedi_rank_02"))
assert(next(candidate.waypoints) ~= nil)
assert(readScreenPlayData(candidate, "JediShrineProgression", "outroShrineId") == "")
assert(not JediShrineProgression:startOutro(candidate))

local delegatedStarts, delegatedSpawns = 0, 0
function GoToTheater:taskStart() delegatedStarts = delegatedStarts + 1 return true end
function GoToTheater:spawnTheaterObjects() delegatedSpawns = delegatedSpawns + 1 end
writeScreenPlayData(candidate, "PadawanTrials", "startedTrials", 1)
writeScreenPlayData(candidate, "PadawanTrials", "trialsCompleted", #padawanTrialQuests - 1)
assert(not JediShrineProgression:startOutro(candidate))
assert(not MellichaeOutroTheater:start(candidate))
MellichaeOutroTheater:spawnTheaterObjects(candidate)
assert(delegatedStarts == 0 and delegatedSpawns == 0)

JediTrials:setCurrentTrial(candidate, 1)
PadawanTrials:passTrial(candidate)
assert(JediTrials:hasCompletedPadawanTasks(candidate))
assert(FsOutro:isOnOutro(candidate))
assert(not candidate:hasSkill("force_title_jedi_rank_02") and candidate:getJediState() == 1)
assert(readScreenPlayData(candidate, "PadawanTrials", "completedTrials") == "")
assert(readScreenPlayData(candidate, "JediShrineProgression", "outroShrineId") == "102")
local assignedShrine = readScreenPlayData(candidate, "JediShrineProgression", "outroShrineId")
assert(JediShrineProgression:onLoggedIn(candidate))
assert(readScreenPlayData(candidate, "JediShrineProgression", "outroShrineId") == assignedShrine)
assert(MellichaeOutroTheater:start(candidate))
MellichaeOutroTheater:spawnTheaterObjects(candidate)
assert(delegatedStarts == 1 and delegatedSpawns == 1)
FsOutro:setCurrentStep(candidate, FsOutro.MELLICHAETHEATER)
local robesBefore = robesGiven
failedSkill = "force_title_jedi_rank_02"
defeatMellichae(candidate)
assert(candidate:hasScreenPlayState(32, "VillageJediProgression"))
assert(not candidate:hasSkill("force_title_jedi_rank_02") and candidate:getJediState() == 1)
assert(readScreenPlayData(candidate, "PadawanTrials", "completedTrials") == "" and robesGiven == robesBefore)
failedSkill = nil
assert(JediShrineProgression:onLoggedIn(candidate))
assert(candidate:hasSkill("force_title_jedi_rank_02") and candidate:getJediState() == 2)
assert(robesGiven == robesBefore + 1)
JediTrials:unlockJediPadawan(candidate)
defeatMellichae(candidate)
assert(robesGiven == robesBefore + 1)

local credited = newPlayer()
credited.skills.force_title_jedi_novice = true
credited:setJediState(1)
credited:setScreenPlayState(32, "VillageJediProgression")
writeScreenPlayData(credited, "PadawanTrials", "startedTrials", 1)
writeScreenPlayData(credited, "PadawanTrials", "trialsCompleted", #padawanTrialQuests - 1)
JediTrials:setCurrentTrial(credited, 1)
failedSkill = "force_title_jedi_rank_02"
PadawanTrials:passTrial(credited)
assert(not credited:hasSkill("force_title_jedi_rank_02"))
failedSkill = nil
ForceShrineMenuComponent:doMeditate(objects[101], credited)
assert(credited:hasSkill("force_title_jedi_rank_02") and credited:getJediState() == 2)
assert(readScreenPlayData(credited, "JediShrineProgression", "outroShrineId") == "")

local testing = newPlayer()
JediTrials:completePadawanForTesting(testing)
assert(testing:hasSkill("force_title_jedi_rank_02") and testing:getJediState() == 2)
assert(readScreenPlayData(testing, "PadawanTrials", "completedTrials") == "1")

knightTrialQuests = { {}, {} }
local retriedKnight = false
KnightTrials.getTrialShrine = function() return nil end
KnightTrials.startNextKnightTrial = function(_, pPlayer) retriedKnight = pPlayer == knight end
writeScreenPlayData(knight, "KnightTrials", "startedTrials", 1)
writeScreenPlayData(knight, "KnightTrials", "trialsCompleted", 2)
writeScreenPlayData(knight, "JediTrials", "currentTrial", 2)
ForceShrineMenuComponent:doMeditate(objects[101], knight)
assert(retriedKnight)

Object = ScreenPlay
dofile("scripts/screenplays/conv_handler.lua")
dofile("scripts/screenplays/village/convos/elder_conv_handler.lua")
ConvoTemplate = {}
function ConvoTemplate:new(value)
	function value:addScreen(screen) self.screens[screen.id] = screen end
	return value
end
ConvoScreen = {}
function ConvoScreen:new(value) return value end
local elderTemplates = {}
function addConversationTemplate(name, template) elderTemplates[name] = template end

for phase = 1, 4 do
	dofile("scripts/mobile/conversations/village/phase" .. phase .. "/elder_phase" .. phase .. "_conv.lua")
	local template = elderTemplates["villageElderPhase" .. phase .. "ConvoTemplate"]
	assert(template.luaClassHandler == "villageElderConvoHandler")
	assert(template.screens[template.initialScreen] ~= nil)
	assert(#template.screens.intro.options == (phase == 1 and 1 or 2))
	for id, screen in pairs(template.screens) do
		assert(not id:find("crystal") and not screen.leftDialog:find("s_199fe2af") and not screen.leftDialog:find("s_bdd3bae5"))
		for _, option in ipairs(screen.options) do
			assert(option[1] ~= "@conversation/village_elder_1:s_9dc8bf5d")
			assert(template.screens[option[2]] ~= nil)
		end
	end
	assert(villageElderConvoHandler:runScreenHandlers(template, nil, nil, 0, template.screens.intro) == template.screens.intro)
end

local trainerType = "trainer_fs"
local trainerQualified = true
SkillTrainer = {
	getTrainerType = function() return trainerType end,
	getPrerequisiteTrainerSkills = function() return {} end,
	hasAllPrereqSkills = function() return trainerQualified end,
	hasSurpassedTrainer = function() return false end,
}
dofile("scripts/screenplays/trainers/trainerConvHandler.lua")
local trainerTemplate = { getScreen = function(_, name) return name end }
for _, initialState in ipairs({ 0, 1, 2, 4, 8 }) do
	local trainee = newPlayer()
	trainee:setJediState(initialState)
	assert(trainerConvHandler:getInitialScreen(trainee, nil, trainerTemplate) == "intro")
	assert(trainee:getJediState() == math.max(1, initialState))
	assert(next(trainee.skills) == nil and next(trainee.states) == nil and next(trainee.data) == nil)
end
local unqualified = newPlayer()
trainerQualified = false
assert(trainerConvHandler:getInitialScreen(unqualified, nil, trainerTemplate) == "no_qualify")
assert(unqualified:getJediState() == 1)
trainerType, trainerQualified = "trainer_artisan", true
local otherTrainee = newPlayer()
assert(trainerConvHandler:getInitialScreen(otherTrainee, nil, trainerTemplate) == "intro")
assert(otherTrainee:getJediState() == 0)
trainerType = "trainer_fs"
local missingGhost = newEntity({ player = true })
local errorCount = #errors
assert(trainerConvHandler:getInitialScreen(missingGhost, nil, trainerTemplate) == "trainer_unknown")
assert(#errors == errorCount + 1 and #missingGhost.messages == 1)

print("Jedi progression tests passed")
