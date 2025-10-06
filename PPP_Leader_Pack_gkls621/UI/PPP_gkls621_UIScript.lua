local TRAIT_PPP = "TRAIT_CIVILIZATION_PPP_gkls621"
local TRAIT_ARISA = "TRAIT_LEADER_ARISA_gkls621"
local EARLY_EMPIRE_INDEX = GameInfo.Civics["CIVIC_EARLY_EMPIRE"].Index
local POLITICAL_PHILOSOPHY_INDEX = GameInfo.Civics["CIVIC_POLITICAL_PHILOSOPHY"].Index

-- From HUAN's MyGO!!!!!
function PlayerHasLeaderTraitUI(playerID, sTraitType)
	local config = PlayerConfigurations[playerID]
	if config ~= nil then
		local sLeaderType = config:GetLeaderTypeName()
	    for tRow in GameInfo.LeaderTraits() do
			if tRow.LeaderType == sLeaderType and tRow.TraitType == sTraitType then 
				print("Has_LA:"..sTraitType)
				return true 
			end
		end
	end
    return false
end

function PlayerHasCivTraitUI(playerID, sTraitType)
	local config = PlayerConfigurations[playerID]
	if config ~= nil then
		local sCivType = config:GetCivilizationTypeName()
	    for tRow in GameInfo.CivilizationTraits() do
			if tRow.CivilizationType == sCivType and tRow.TraitType == sTraitType then 
				print("Has_UA:"..sTraitType)
				return true 
			end
		end
	end
    return false
end
-----

function GklsPPPProgressOnCivicCompleted(playerID, civicID)
    if (playerID == -1) or (civicID == -1) then return; end
    if not PlayerHasCivTraitUI(playerID, TRAIT_PPP) then return; end
    local pPlayer = Players[playerID]
    if pPlayer == nil then return; end
    local pCivic = pPlayer:GetCulture()
    if pCivic == nil then return;end
    if (pCivic:HasCivic(EARLY_EMPIRE_INDEX)) and (pCivic:HasCivic(POLITICAL_PHILOSOPHY_INDEX)) then
        return; end
    if not(pCivic:HasCivic(EARLY_EMPIRE_INDEX)) and (civicID ~= EARLY_EMPIRE_INDEX) then
        local pProgress = pCivic:GetCulturalProgress(EARLY_EMPIRE_INDEX)
        ExposedMembers.GklsPPP.GklsSetCulture(playerID, "CIVIC_EARLY_EMPIRE", pProgress)
    end
    if not(pCivic:HasCivic(POLITICAL_PHILOSOPHY_INDEX)) and (civicID ~= POLITICAL_PHILOSOPHY_INDEX) then
        local pProgress = pCivic:GetCulturalProgress(POLITICAL_PHILOSOPHY_INDEX)
        ExposedMembers.GklsPPP.GklsSetCulture(playerID, "CIVIC_POLITICAL_PHILOSOPHY", pProgress)
    end
end

function GklsArisaOnEspionageCompleted(iPlayerID, iMissionID)
    if(iPlayerID == -1) or (iMissionID == -1) then return; end
    if not (PlayerHasLeaderTraitUI(iPlayerID, TRAIT_ARISA)) then return; end
    local pPlayer = Players[iPlayerID];
	if pPlayer then
		local playerDiplomacy:table = pPlayer:GetDiplomacy();
		if playerDiplomacy then
			tMission = playerDiplomacy:GetMission(iPlayerID, iMissionID)
            local operationInfo:table = GameInfo.UnitOperations[tMission.Operation]
	        if operationInfo.Hash == UnitOperationTypes.SPY_STEAL_TECH_BOOST then
		        local techIndex = GameInfo.Technologies[tMission.LootInfo].Index
                ExposedMembers.GklsPPP.GklsSetTech(iPlayerID, techIndex)
                print("Arisa espionage: "..tMission.LootInfo.." unlocked")
            end
        end
    end
end

Events.CivicCompleted.Add(GklsPPPProgressOnCivicCompleted)
Events.SpyMissionCompleted.Add(GklsArisaOnEspionageCompleted)