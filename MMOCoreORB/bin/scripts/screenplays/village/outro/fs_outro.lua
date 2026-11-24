local ObjectManager = require("managers.object.object_manager")
local QuestManager = require("managers.quest.quest_manager")

FsOutro = ScreenPlay:new {
	OLDMANWAIT = 1,
	OLDMANMEET = 2,
	MELLICHAETHEATER = 3,
	FORCESHRINE = 4,

	stepDelay = {
		[1] = { 15600, 86400 }, -- Old man visit, 1 hour to 1 day
	}
}

function FsOutro:getCurrentStep(pPlayer)
	local curStep = readScreenPlayData(pPlayer, "VillageJediProgression", "FsOutroStep")

	if (curStep == "") then
		curStep = 1
		self:setCurrentStep(pPlayer, self.OLDMANWAIT)
	end

	return tonumber(curStep)
end

function FsOutro:setCurrentStep(pPlayer, step)
	writeScreenPlayData(pPlayer, "VillageJediProgression", "FsOutroStep", step)
end

function FsOutro:isOnOutro(pPlayer)
	return JediTrials:hasCompletedPadawanTasks(pPlayer) and CreatureObject(pPlayer):hasScreenPlayState(JediShrineProgression.OUTRO_STARTED, "JediShrineProgression") and not VillageJediManagerCommon.hasJediProgressionScreenPlayState(pPlayer, VILLAGE_JEDI_PROGRESSION_DEFEATED_MELLIACHAE)
end

function FsOutro:hasDelayPassed(pPlayer)
	local stepDelay = tonumber(readScreenPlayData(pPlayer, "VillageJediProgression", "FsOutroDelay"))

	if (stepDelay == nil or stepDelay == 0) then
		return true
	end
	
	return os.time() >= stepDelay
end

function FsOutro:onLoggedIn(pPlayer)
	if (not self:isOnOutro(pPlayer)) then
		return
	end

	local curStep = self:getCurrentStep(pPlayer)

	if (curStep == self.OLDMANWAIT or curStep == self.OLDMANMEET) then
		if (readData(SceneObject(pPlayer):getObjectID() .. ":shrineOldMan:outro:mobile") == 0) then
			QuestManager.resetQuest(pPlayer, QuestManager.quests.OLD_MAN_FINAL)
			self:setCurrentStep(pPlayer, self.OLDMANWAIT)
			JediShrineProgression:prepareMeeting(pPlayer, "outro")
		end
	elseif (curStep == self.MELLICHAETHEATER) then
		if (MellichaeOutroTheater:hasTaskStarted(pPlayer)) then
			MellichaeOutroTheater:finish(pPlayer)
		end

		QuestManager.resetQuest(pPlayer, QuestManager.quests.FS_THEATER_CAMP)
		local result = MellichaeOutroTheater:start(pPlayer)
	end
end

function FsOutro:startOldMan(pPlayer)
	if (pPlayer ~= nil and self:isOnOutro(pPlayer) and self:getCurrentStep(pPlayer) == self.OLDMANWAIT) then
		JediShrineProgression:prepareMeeting(pPlayer, "outro")
	end
end

function FsOutro:onLoggedOut(pPlayer)
	if (not self:isOnOutro(pPlayer)) then
		return
	end

	local curStep = self:getCurrentStep(pPlayer)

	if (curStep == self.MELLICHAETHEATER) then
		MellichaeOutroTheater:finish(pPlayer)
	end
end

function FsOutro:doOldManSpawn(pPlayer)
	if (pPlayer == nil) then
		return
	end

	self:startOldMan(pPlayer)
end

function FsOutro:completeVillageOutroFrog(pPlayer)
	if (pPlayer == nil) then
		return
	end

	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return
	end

	QuestManager.completeQuest(pPlayer, QuestManager.quests.OLD_MAN_FINAL)
	QuestManager.completeQuest(pPlayer, QuestManager.quests.FS_THEATER_FINAL)

	VillageJediManagerCommon.setJediProgressionScreenPlayState(pPlayer, VILLAGE_JEDI_PROGRESSION_DEFEATED_MELLIACHAE)

	if (JediTrials:hasCompletedPadawanTasks(pPlayer)) then
		JediTrials:unlockJediPadawan(pPlayer)
	end
end