local QuestManager = require("managers.quest.quest_manager")
local SpawnMobiles = require("utils.spawn_mobiles")

JediShrineProgression = ScreenPlay:new {
	INTRO_ASSIGNED = 1,
	OUTRO_STARTED = 2,
	TRIALS_READY = 4,
	INTRO_COMPLETE = 8,
}

function JediShrineProgression:getMeetingKey(kind)
	return kind == "intro" and "introShrineId" or "outroShrineId"
end

function JediShrineProgression:getEncounter(kind)
	return kind == "intro" and OldManIntroEncounter or OldManOutroEncounter
end

function JediShrineProgression:selectShrine(excludedId)
	local planets = {}

	for _, planet in ipairs(JediTrials.shrinePlanets) do
		if (isZoneEnabled(planet)) then
			local shrines = {}
			for _, id in ipairs(JediTrials.forceShrineIds[planet]) do
				local shrine = getSceneObject(id)
				if (id ~= excludedId and shrine ~= nil and SceneObject(shrine):getZoneName() == planet) then
					table.insert(shrines, shrine)
				end
			end
			if (#shrines > 0) then
				table.insert(planets, shrines)
			end
		end
	end

	if (#planets == 0) then
		return nil
	end

	local shrines = planets[getRandomNumber(1, #planets)]
	return shrines[getRandomNumber(1, #shrines)]
end

function JediShrineProgression:removeWaypoint(pPlayer, kind)
	local waypointId = tonumber(readScreenPlayData(pPlayer, "JediShrineProgression", kind .. "WaypointId"))
	local ghost = CreatureObject(pPlayer):getPlayerObject()
	if (waypointId ~= nil and ghost ~= nil) then
		PlayerObject(ghost):removeWaypoint(waypointId, true)
	end
	deleteScreenPlayData(pPlayer, "JediShrineProgression", kind .. "WaypointId")
end

function JediShrineProgression:removeArea(pPlayer, kind)
	local key = SceneObject(pPlayer):getObjectID() .. ":shrineOldMan:" .. kind .. ":area"
	local areaId = readData(key)
	local area = getSceneObject(areaId)
	if (area ~= nil) then
		deleteData(areaId .. ":shrineOldManOwner")
		dropObserver(ENTEREDAREA, "JediShrineProgression", "onEnteredArea", area)
		SceneObject(area):destroyObjectFromWorld()
	end
	deleteData(key)
end

function JediShrineProgression:despawn(pPlayer, kind, cooldown)
	local encounter = self:getEncounter(kind)
	local key = SceneObject(pPlayer):getObjectID() .. ":shrineOldMan:" .. kind .. ":mobile"
	if (readData(key) ~= 0) then
		SpawnMobiles.despawnMobiles(pPlayer, encounter.taskName, false)
		deleteData(key)
		deleteData(key .. ":finished")
		deleteData(key .. ":expires")
		if (cooldown) then
			writeScreenPlayData(pPlayer, "JediShrineProgression", kind .. "Cooldown", os.time() + 300)
		end
	end
end

function JediShrineProgression:prepareMeeting(pPlayer, kind)
	if (kind == "outro" and not JediTrials:hasCompletedPadawanTasks(pPlayer)) then
		return false
	end
	local ghost = CreatureObject(pPlayer):getPlayerObject()
	if (ghost == nil) then
		return false
	end
	local encounter = self:getEncounter(kind)
	if (encounter:hasTaskStarted(pPlayer)) then
		SpawnMobiles.despawnMobiles(pPlayer, encounter.taskName, false)
		encounter:setTaskFinished(pPlayer)
		dropObserver(LOGGEDIN, encounter.taskName, "onLoggedIn", pPlayer)
		dropObserver(LOGGEDOUT, encounter.taskName, "onLoggedOut", pPlayer)
	end

	local key = self:getMeetingKey(kind)
	local shrineId = tonumber(readScreenPlayData(pPlayer, "JediShrineProgression", key))
	local shrine = shrineId ~= nil and getSceneObject(shrineId) or nil
	if (shrine ~= nil and not isZoneEnabled(SceneObject(shrine):getZoneName())) then
		shrine = nil
	end
	if (shrine == nil) then
		local excludedId = kind == "outro" and tonumber(readScreenPlayData(pPlayer, "JediShrineProgression", "introShrineId")) or nil
		shrine = self:selectShrine(excludedId)
		if (shrine == nil) then
			printLuaError("JediShrineProgression: no available " .. kind .. " shrine for " .. SceneObject(pPlayer):getObjectID())
			CreatureObject(pPlayer):sendSystemMessage("No Force shrine is currently available. Please contact a CSR.")
			return false
		end
		self:removeArea(pPlayer, kind)
		self:removeWaypoint(pPlayer, kind)
		shrineId = SceneObject(shrine):getObjectID()
		writeScreenPlayData(pPlayer, "JediShrineProgression", key, shrineId)
	end

	local planet = SceneObject(shrine):getZoneName()
	local waypoint = PlayerObject(ghost):getWaypointAt(SceneObject(shrine):getWorldPositionX(), SceneObject(shrine):getWorldPositionY(), planet)
	if (waypoint == nil) then
		local waypointId = PlayerObject(ghost):addWaypoint(planet, planet:gsub("^%l", string.upper) .. " Force Shrine", "", SceneObject(shrine):getWorldPositionX(), 0, SceneObject(shrine):getWorldPositionY(), WAYPOINT_YELLOW, true, true, 0)
		if (waypointId == nil or waypointId == 0) then
			printLuaError("JediShrineProgression: failed to create shrine waypoint for " .. SceneObject(pPlayer):getObjectID())
			CreatureObject(pPlayer):sendSystemMessage("The Force shrine waypoint could not be created. Please contact a CSR.")
			return false
		end
		writeScreenPlayData(pPlayer, "JediShrineProgression", kind .. "WaypointId", waypointId)
		CreatureObject(pPlayer):sendSystemMessage("Seek the Force shrine marked on your datapad.")
	end

	local areaKey = SceneObject(pPlayer):getObjectID() .. ":shrineOldMan:" .. kind .. ":area"
	local area = getSceneObject(readData(areaKey))
	if (area == nil) then
		area = spawnActiveArea(SceneObject(shrine):getZoneName(), "object/active_area.iff", SceneObject(shrine):getWorldPositionX(), 0, SceneObject(shrine):getWorldPositionY(), 32, 0)
		if (area == nil) then
			printLuaError("JediShrineProgression: failed to create shrine area for " .. SceneObject(pPlayer):getObjectID())
			CreatureObject(pPlayer):sendSystemMessage("The Force shrine encounter could not be prepared. Please contact a CSR.")
			return false
		end
		local areaId = SceneObject(area):getObjectID()
		writeData(areaKey, areaId)
		writeData(areaId .. ":shrineOldManOwner", SceneObject(pPlayer):getObjectID())
		createObserver(ENTEREDAREA, "JediShrineProgression", "onEnteredArea", area)
	end

	if (SceneObject(pPlayer):getZoneName() == SceneObject(shrine):getZoneName() and CreatureObject(pPlayer):isInRangeWithObject(shrine, 32)) then
		self:onEnteredArea(area, pPlayer)
	end
	return true
end

function JediShrineProgression:onEnteredArea(pArea, pPlayer)
	if (pArea == nil or pPlayer == nil or not SceneObject(pPlayer):isPlayerCreature()) then
		return 0
	end
	local playerId = SceneObject(pPlayer):getObjectID()
	local areaId = SceneObject(pArea):getObjectID()
	if (readData(areaId .. ":shrineOldManOwner") ~= playerId) then
		return 0
	end
	local kind = readData(playerId .. ":shrineOldMan:intro:area") == areaId and "intro" or "outro"
	if (kind == "outro" and not JediTrials:hasCompletedPadawanTasks(pPlayer)) then
		return 0
	end
	local cooldown = tonumber(readScreenPlayData(pPlayer, "JediShrineProgression", kind .. "Cooldown")) or 0
	local key = playerId .. ":shrineOldMan:" .. kind .. ":mobile"
	if (readData(key) ~= 0 or os.time() < cooldown or CreatureObject(pPlayer):isDead() or CreatureObject(pPlayer):isIncapacitated() or SceneObject(pPlayer):getParentID() ~= 0 or not CreatureObject(pPlayer):isInRangeWithObject(pArea, 32)) then
		return 0
	end

	local encounter = self:getEncounter(kind)
	if (not SpawnMobiles.isPrefixFree(pPlayer, encounter.taskName)) then
		return 0
	end
	local point = getSpawnPoint(SceneObject(pArea):getZoneName(), SceneObject(pArea):getWorldPositionX(), SceneObject(pArea):getWorldPositionY(), 3, 5, true)
	if (point == nil) then
		printLuaError("JediShrineProgression: failed to find an Old Man spawn point for " .. playerId)
		CreatureObject(pPlayer):sendSystemMessage("The Old Man could not appear. Please contact a CSR.")
		return 0
	end
	local mobiles = SpawnMobiles.generateMobileObjects(pPlayer, encounter.taskName, encounter.spawnObjectList, { point })
	if (mobiles == nil or not SpawnMobiles.isValidMobile(mobiles[1])) then
		SpawnMobiles.despawnMobiles(pPlayer, encounter.taskName, false)
		printLuaError("JediShrineProgression: failed to spawn the Old Man for " .. playerId)
		CreatureObject(pPlayer):sendSystemMessage("The Old Man could not appear. Please contact a CSR.")
		return 0
	end
	CreatureObject(mobiles[1]):setPvpStatusBitmask(0)
	local mobileId = SceneObject(mobiles[1]):getObjectID()
	writeData(key, mobileId)
	writeData(key .. ":expires", os.time() + 300)
	encounter:onEncounterInRange(pPlayer, mobiles)
	createEvent(2000, "JediShrineProgression", "checkMeeting", pPlayer, kind .. ":" .. mobileId)
	return 0
end

function JediShrineProgression:checkMeeting(pPlayer, args)
	if (pPlayer == nil) then
		return
	end
	local kind, id = string.match(args, "^(%a+):(%d+)$")
	if (kind == nil) then
		return
	end
	local key = SceneObject(pPlayer):getObjectID() .. ":shrineOldMan:" .. kind .. ":mobile"
	if (readData(key) ~= tonumber(id)) then
		return
	end
	if (readData(key .. ":finished") == tonumber(id)) then
		return
	end
	local mobile = getSceneObject(tonumber(id))
	local ghost = CreatureObject(pPlayer):getPlayerObject()
	if (ghost == nil or not PlayerObject(ghost):isOnline() or mobile == nil) then
		self:despawn(pPlayer, kind, false)
	elseif (os.time() >= readData(key .. ":expires") or SceneObject(pPlayer):getZoneName() ~= SceneObject(mobile):getZoneName() or not CreatureObject(pPlayer):isInRangeWithObject(mobile, 64)) then
		self:despawn(pPlayer, kind, true)
		if (kind == "intro") then
			FsIntro:setCurrentStep(pPlayer, FsIntro.OLDMANWAIT)
			QuestManager.resetQuest(pPlayer, QuestManager.quests.OLD_MAN_INITIAL)
		else
			FsOutro:setCurrentStep(pPlayer, FsOutro.OLDMANWAIT)
			QuestManager.resetQuest(pPlayer, QuestManager.quests.OLD_MAN_FINAL)
		end
	else
		createEvent(2000, "JediShrineProgression", "checkMeeting", pPlayer, args)
	end
end

function JediShrineProgression:finishMeeting(pPlayer, kind, completed)
	local key = SceneObject(pPlayer):getObjectID() .. ":shrineOldMan:" .. kind .. ":mobile"
	local mobileId = readData(key)
	writeData(key .. ":finished", mobileId)
	if (completed) then
		self:removeArea(pPlayer, kind)
		self:removeWaypoint(pPlayer, kind)
	end
	createEvent(10000, "JediShrineProgression", "finishDespawn", pPlayer, kind .. ":" .. mobileId .. ":" .. (completed and "1" or "0"))
end

function JediShrineProgression:finishDespawn(pPlayer, args)
	if (pPlayer == nil) then
		return
	end
	local kind, id, completed = string.match(args, "^(%a+):(%d+):([01])$")
	if (kind == nil or readData(SceneObject(pPlayer):getObjectID() .. ":shrineOldMan:" .. kind .. ":mobile") ~= tonumber(id)) then
		return
	end
	self:despawn(pPlayer, kind, completed == "0")
	if (completed == "0") then
		if (kind == "intro") then
			FsIntro:setCurrentStep(pPlayer, FsIntro.OLDMANWAIT)
			QuestManager.resetQuest(pPlayer, QuestManager.quests.OLD_MAN_INITIAL)
		else
			FsOutro:setCurrentStep(pPlayer, FsOutro.OLDMANWAIT)
			QuestManager.resetQuest(pPlayer, QuestManager.quests.OLD_MAN_FINAL)
		end
	end
end

function JediShrineProgression:grantNovice(pPlayer)
	local ghost = CreatureObject(pPlayer):getPlayerObject()
	if (ghost == nil) then
		return false
	end
	local oldState = PlayerObject(ghost):getJediState()
	if (oldState < 1) then
		PlayerObject(ghost):setJediState(1)
	end
	if (not CreatureObject(pPlayer):hasSkill("force_title_jedi_novice")) then
		awardSkill(pPlayer, "force_title_jedi_novice")
	end
	if (not CreatureObject(pPlayer):hasSkill("force_title_jedi_novice")) then
		if (oldState < 1) then
			PlayerObject(ghost):setJediState(oldState)
		end
		printLuaError("JediShrineProgression: failed to award Jedi novice for " .. SceneObject(pPlayer):getObjectID())
		CreatureObject(pPlayer):sendSystemMessage("Your Jedi novice skill could not be awarded. Please contact a CSR.")
		return false
	end
	return true
end

function JediShrineProgression:startIntro(pPlayer)
	CreatureObject(pPlayer):setScreenPlayState(self.INTRO_ASSIGNED, "JediShrineProgression")
	FsIntro:setCurrentStep(pPlayer, FsIntro.OLDMANWAIT)
	return self:prepareMeeting(pPlayer, "intro")
end

function JediShrineProgression:startOutro(pPlayer)
	if (not JediTrials:hasCompletedPadawanTasks(pPlayer)) then
		CreatureObject(pPlayer):sendSystemMessage("Complete all Padawan trials before seeking the Old Man again.")
		return false
	end
	if (CreatureObject(pPlayer):hasScreenPlayState(self.OUTRO_STARTED, "JediShrineProgression")) then
		if (FsOutro:getCurrentStep(pPlayer) <= FsOutro.OLDMANMEET) then
			return self:prepareMeeting(pPlayer, "outro")
		end
		CreatureObject(pPlayer):sendSystemMessage("Seek Mellichae at the camp marked on your datapad.")
		return true
	end
	CreatureObject(pPlayer):setScreenPlayState(self.OUTRO_STARTED, "JediShrineProgression")
	FsOutro:setCurrentStep(pPlayer, FsOutro.OLDMANWAIT)
	return self:prepareMeeting(pPlayer, "outro")
end

function JediShrineProgression:startPadawanTrials(pPlayer)
	local creature = CreatureObject(pPlayer)
	local wasReady = creature:hasScreenPlayState(self.TRIALS_READY, "JediShrineProgression") and creature:hasScreenPlayState(self.INTRO_COMPLETE, "JediShrineProgression")
	creature:setScreenPlayState(self.INTRO_COMPLETE, "JediShrineProgression")
	creature:setScreenPlayState(self.TRIALS_READY, "JediShrineProgression")
	if (not JediTrials:hasCompletedPadawanTasks(pPlayer)) then
		self:despawn(pPlayer, "outro", false)
		self:removeArea(pPlayer, "outro")
		self:removeWaypoint(pPlayer, "outro")
		if (MellichaeOutroTheater:hasTaskStarted(pPlayer)) then
			MellichaeOutroTheater:finish(pPlayer)
		end
		creature:removeScreenPlayState(self.OUTRO_STARTED, "JediShrineProgression")
		FsOutro:setCurrentStep(pPlayer, FsOutro.OLDMANWAIT)
	end
	if (not wasReady and JediTrials:isEligibleForPadawanTrials(pPlayer) and not JediTrials:isOnPadawanTrials(pPlayer)) then
		PadawanTrials:doPadawanTrialsSetup(pPlayer)
	end
	return true
end

function JediShrineProgression:onLoggedIn(pPlayer)
	local creature = CreatureObject(pPlayer)
	if (creature:hasSkill("force_title_jedi_rank_02")) then
		return true
	end
	if (creature:hasScreenPlayState(VILLAGE_JEDI_PROGRESSION_DEFEATED_MELLIACHAE, "VillageJediProgression")) then
		if (JediTrials:hasCompletedPadawanTasks(pPlayer)) then
			JediTrials:unlockJediPadawan(pPlayer)
		else
			self:startPadawanTrials(pPlayer)
		end
		return true
	end
	if (JediTrials:hasCompletedPadawanTasks(pPlayer)) then
		self:startOutro(pPlayer)
		return true
	end

	local completedVillage = creature:hasScreenPlayState(VILLAGE_JEDI_PROGRESSION_COMPLETED_VILLAGE, "VillageJediProgression")
	if (completedVillage or creature:hasScreenPlayState(self.OUTRO_STARTED, "JediShrineProgression")) then
		if (not self:grantNovice(pPlayer)) then
			return false
		end
		self:startPadawanTrials(pPlayer)
	elseif (QuestManager.hasCompletedQuest(pPlayer, QuestManager.quests.FS_VILLAGE_ELDER)) then
		if (not self:grantNovice(pPlayer)) then
			return false
		end
		self:startPadawanTrials(pPlayer)
	elseif (FsIntro:isOnIntro(pPlayer)) then
		local step = FsIntro:getCurrentStep(pPlayer)
		if (step >= FsIntro.SITHWAIT and step <= FsIntro.USEDATAPADTWO and OldManIntroEncounter:hasForceCrystal(pPlayer)) then
			return self:grantNovice(pPlayer)
		elseif (step == FsIntro.VILLAGE) then
			if (not self:grantNovice(pPlayer)) then
				return false
			end
			GoToDathomir:finish(pPlayer)
			local ghost = creature:getPlayerObject()
			local waypoint = ghost ~= nil and PlayerObject(ghost):getWaypointAt(5306, -4145, "dathomir") or nil
			if (waypoint ~= nil and SceneObject(waypoint):getCustomObjectName() == "@quest/force_sensitive/intro:goto_dath_sum") then
				PlayerObject(ghost):removeWaypoint(SceneObject(waypoint):getObjectID(), true)
			end
			self:startPadawanTrials(pPlayer)
		end
	end
	return true
end

function JediShrineProgression:onLoggedOut(pPlayer)
	for _, kind in ipairs({ "intro", "outro" }) do
		self:despawn(pPlayer, kind, false)
		self:removeArea(pPlayer, kind)
	end
end
