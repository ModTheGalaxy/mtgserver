local ObjectManager = require("managers.object.object_manager")
local Logger = require("utils.logger")

Glowing = ScreenPlay:new {
	requiredBadges = {
		{ type = "exploration_jedi", amount = 3 },
	}
}

function Glowing:getJediBadgeCount(pPlayer)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()
	if (pGhost == nil) then
		return 0
	end
	local count = 0
	for _, badge in ipairs(getBadgeListByType("exploration_jedi")) do
		if (PlayerObject(pGhost):hasBadge(badge)) then
			count = count + 1
		end
	end
	return count
end

function Glowing:getCompletedBadgeTypeCount(pPlayer)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return 0
	end

	local typesCompleted = 0

	for i = 1, #self.requiredBadges, 1 do
		local type = self.requiredBadges[i].type
		local requiredAmount = self.requiredBadges[i].amount

		local badgeListByType = getBadgeListByType(type)
		local badgeCount = 0

		for j = 1, #badgeListByType, 1 do
			if PlayerObject(pGhost):hasBadge(badgeListByType[j]) then
				badgeCount = badgeCount + 1
			end
		end

		if badgeCount >= requiredAmount then
			typesCompleted = typesCompleted + 1
		end
	end

	return typesCompleted
end

function Glowing:hasRequiredBadgeCount(pPlayer)
	return self:getCompletedBadgeTypeCount(pPlayer) == #self.requiredBadges
end

-- Check if the player is glowing or not.
-- @param pPlayer pointer to the creature object of the player.
function Glowing:isGlowing(pPlayer)
	return VillageJediManagerCommon.hasJediProgressionScreenPlayState(pPlayer, VILLAGE_JEDI_PROGRESSION_GLOWING)
end

-- Event handler for the BADGEAWARDED event.
-- @param pPlayer pointer to the creature object of the player who was awarded with a badge.
-- @param pPlayer2 pointer to the creature object of the player who was awarded with a badge.
-- @param badgeNumber the badge number that was awarded.
-- @return 0 to keep the observer active.
function Glowing:badgeAwardedEventHandler(pPlayer, pPlayer2, badgeNumber)
	if (pPlayer == nil) then
		return 0
	end

	if self:hasRequiredBadgeCount(pPlayer) and not self:isGlowing(pPlayer) and not CreatureObject(pPlayer):hasSkill("force_title_jedi_novice") then
		VillageJediManagerCommon.setJediProgressionScreenPlayState(pPlayer, VILLAGE_JEDI_PROGRESSION_GLOWING)
		FsIntro:startPlayerOnIntro(pPlayer)
		return 1
	end

	return 0
end

-- Register observer on the player for observing badge awards.
-- @param pPlayer pointer to the creature object of the player to register observers on.
function Glowing:registerObservers(pPlayer)
	dropObserver(BADGEAWARDED, "Glowing", "badgeAwardedEventHandler", pPlayer)
	createObserver(BADGEAWARDED, "Glowing", "badgeAwardedEventHandler", pPlayer)
end

-- Handling of the onPlayerLoggedIn event. The progression of the player will be checked and observers will be registered.
-- @param pPlayer pointer to the creature object of the player who logged in.
function Glowing:onPlayerLoggedIn(pPlayer)
	if not self:isGlowing(pPlayer) and not CreatureObject(pPlayer):hasSkill("force_title_jedi_novice") then
		if self:hasRequiredBadgeCount(pPlayer) then
			VillageJediManagerCommon.setJediProgressionScreenPlayState(pPlayer, VILLAGE_JEDI_PROGRESSION_GLOWING)
			FsIntro:startPlayerOnIntro(pPlayer)
		else
			self:registerObservers(pPlayer)
		end
	end
end

-- Handling of the checkForceStatus command.
-- @param pPlayer pointer to the creature object of the player who performed the command
function Glowing:checkForceStatusCommand(pPlayer)
	CreatureObject(pPlayer):sendSystemMessage("Jedi POI badges: " .. self:getJediBadgeCount(pPlayer) .. "/" .. self.requiredBadges[1].amount)
end

return Glowing
