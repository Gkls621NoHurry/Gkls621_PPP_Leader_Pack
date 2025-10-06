local TRAIT_PPP = "TRAIT_CIVILIZATION_PPP_gkls621"
local TYPE_KASUMI = "LEADER_KASUMI_gkls621"
local TYPE_RIMI = "LEADER_RIMI_gkls621"
local TYPE_TAE = "LEADER_TAE_gkls621"
local INHERITOR_INDEX = GameInfo.Units["UNIT_INHERITOR_gkls621"].Index or -1
local RIMI_ZOMBIE_INDEX = GameInfo.Units["UNIT_RIMI_ZOMBIE_gkls621"].Index or -1
local EARLY_EMPIRE_INDEX = GameInfo.Civics["CIVIC_EARLY_EMPIRE"].Index or -1
local POLITICAL_PHILOSOPHY_INDEX = GameInfo.Civics["CIVIC_POLITICAL_PHILOSOPHY"].Index or -1
local PROPHET_INDEX = GameInfo.GreatPersonClasses["GREAT_PERSON_CLASS_PROPHET"].Index or -1
local MUSICIAN_INDEX = GameInfo.GreatPersonClasses["GREAT_PERSON_CLASS_MUSICIAN"].Index or -1
local E_CONSTANT = 2.718

function GklsCivTraitMatches(playerID, TraitType)
	local config = PlayerConfigurations[playerID]
	if config ~= nil then
		local CivType = config:GetCivilizationTypeName()
	    for tRow in GameInfo.CivilizationTraits() do
			if tRow.CivilizationType == CivType and tRow.TraitType == TraitType then 
				print("This game has civ trait: "..TraitType)
				return true 
			end
		end
	end
    return false
end

function GklsLeaderMatches(playerID, leaderType)
	if playerID == -1 then
		return false
	end
	local pPlayerConfig = PlayerConfigurations[playerID]
	if pPlayerConfig == nil then
		return false
	end
	if pPlayerConfig:GetLeaderTypeName() == leaderType then
		print("GklsLeaderMatches("..playerID.." "..leaderType..")")
		return true
	end
	print("GklsLeaderMatches("..playerID.." "..leaderType..") find it unmatchable")
	return false
end

-- Copied from Ruivo's New Adjacency
function RuivoGetRingPlotIndexes(iX, iY, maxRing)
    local resultPlotIndex = {}   -- 存储最终结果的格子索引列表
    local visited = {}           -- 标记已经访问过的格子，防止重复访问
    local queue = {}             -- 用于广度优先搜索的队列（FIFO）

    local centerPlot = Map.GetPlot(iX, iY)  -- 获取中心格对象
    if not centerPlot then return resultPlotIndex end  -- 如果中心格无效，返回空结果

    local centerIndex = centerPlot:GetIndex()  -- 获取中心格的索引
    visited[centerIndex] = true                -- 标记中心格为已访问
    table.insert(resultPlotIndex, centerIndex) -- 加入结果列表
    table.insert(queue, centerIndex)           -- 加入队列，开始BFS搜索

    -- 广度优先搜索，逐层扩展格子
    while #queue > 0 do
        local currentIndex = table.remove(queue, 1)        -- 取出当前处理的格子索引
        local plot = Map.GetPlotByIndex(currentIndex)      -- 获取对应格子对象
        local dist = Map.GetPlotDistance(iX, iY, plot:GetX(), plot:GetY()) -- 计算该格子与中心格的距离

        -- 如果该格子在 maxRing 范围内，继续扩展它的相邻格子
        if dist < maxRing then
            local adjPlots = Map.GetAdjacentPlots(plot:GetX(), plot:GetY()) -- 获取相邻格子
            for _, adj in ipairs(adjPlots) do
                if adj then
                    local adjIndex = adj:GetIndex()  -- 获取相邻格子的索引
                    if not visited[adjIndex] then   -- 如果未访问过
                        visited[adjIndex] = true    -- 标记为已访问
                        table.insert(resultPlotIndex, adjIndex) -- 加入结果列表
                        table.insert(queue, adjIndex)           -- 加入队列以便后续扩展
                    end
                end
            end
        end
    end

    return resultPlotIndex  -- 返回所有在 maxRing 范围内的格子索引
end

function GklsPPPRelicOnCivicBoosted(playerID, civicID)
    if (playerID == -1) or (civicID == -1) then return; end
    if not GklsCivTraitMatches(playerID, TRAIT_PPP) then return; end
    local pPlayer = Players[playerID]
    local PlayerCities = pPlayer:GetCities()
    if (PlayerCities == nil) then
        pPlayer:SetProperty("GKLS_PPP_RELIC_IOU", 1)
        print("Poppin' Party relic IOU to "..playerID)
        return
    elseif (PlayerCities:GetCount() == 0) then
        pPlayer:SetProperty("GKLS_PPP_RELIC_IOU", 1)
        print("Poppin' Party relic IOU to "..playerID)
        return
    end
    local RelicGranted = pPlayer:GetProperty("GKLS_PPP_RELIC_GRANTED") or 0
    if(RelicGranted == 1) then return; end
    pPlayer:AttachModifierByID("PPP_RELIC_ON_FIRST_INSPIRATION_gkls621")
    print("Poppin' Party relic granted to "..playerID)
    pPlayer:SetProperty("GKLS_PPP_RELIC_GRANTED", 1)
end

function GklsPPPRelicIOU(playerID, cityID, iX, iY)
    if (playerID == -1) or (cityID == -1) then return; end
    if not GklsCivTraitMatches(playerID, TRAIT_PPP) then return; end
    local pPlayer = Players[playerID]
    local IOU = pPlayer:GetProperty("GKLS_PPP_RELIC_IOU") or 0
    if IOU == 1 then
        pPlayer:AttachModifierByID("PPP_RELIC_ON_FIRST_INSPIRATION_gkls621")
        print("Poppin' Party relic granted to "..playerID)
        pPlayer:SetProperty("GKLS_PPP_RELIC_GRANTED", 1)
        pPlayer:SetProperty("GKLS_PPP_RELIC_IOU", 0)
    end
end

function GklsPPPReilcOnInheritorTriumph(killedPlayerID, killedUnitID, playerID, unitID)
    if (killedPlayerID == -1) or (playerID == -1) then return; end
    if (killedUnitID == -1) or (unitID == -1) then return; end
    if not(GklsCivTraitMatches(playerID, TRAIT_PPP)) then return; end
    local pUnit = UnitManager.GetUnit(playerID, unitID)
    local pPlayer = Players[playerID]
    if (pUnit == nil) then return; end
    if (pUnit:GetType() == INHERITOR_INDEX) then
        pPlayer:AttachModifierByID("PPP_RELIC_ON_FIRST_INSPIRATION_gkls621")
        print("Poppin' Party player "..playerID.." inheritor gets relic")
    end
end

function GklsKasumiOnDiplomacyMeet(player1ID, player2ID)
    if (player1ID == -1) or (player2ID == -1) then return; end
    if (GklsLeaderMatches(player1ID, TYPE_KASUMI)) then
        local pPlayer = Players[player1ID]
        local MetPlayers = pPlayer:GetProperty("KASUMI_PLAYERS_MET") or 0
        pPlayer:SetProperty("KASUMI_PLAYERS_MET", MetPlayers +1)
        print("Kasumi player "..player1ID.." +1 prophet point")
    end
    if (GklsLeaderMatches(player2ID, TYPE_KASUMI)) then
        local pPlayer = Players[player2ID]
        local MetPlayers = pPlayer:GetProperty("KASUMI_PLAYERS_MET") or 0
        pPlayer:SetProperty("KASUMI_PLAYERS_MET", MetPlayers +1)
        print("Kasumi player "..player2ID.." +1 prophet point")
    end
end

function GklsTaeOnNationalParkAdded(playerID, iX, iY)
    if (playerID == -1) or (iX == -1) or (iY == -1) then return; end
    if not(GklsLeaderMatches(playerID, TYPE_TAE)) then return; end
    local pPlayer = Players[playerID]
    local pPlot = Map.GetPlot(iX, iY)
    local pCity = Cities.GetPlotPurchaseCity(pPlot)
    local CivParkProperty = pPlayer:GetProperty("TAE_SUM_OF_PARKS") or 0
    pPlayer:SetProperty("TAE_SUM_OF_PARKS",CivParkProperty +1)
    local cityLocation = pCity:GetLocation()
    local pPlayer = Players[playerID]
    local resultPlotIndex = RuivoGetRingPlotIndexes(cityLocation.x, cityLocation.y, 4)
    for _, PlotIndex in ipairs(resultPlotIndex) do
        local plot = Map.GetPlotByIndex(PlotIndex)
        if (plot ~= nil) then 
            if (plot:GetResourceType() ~= -1) and (plot:IsNationalPark()) then  -- -1 表示没有资源
                local ResourceType = GameInfo.Resources[plot:GetResourceType()]
                print("Tae "..PlotIndex.." has resource "..plot:GetResourceType())
                if ResourceType.ResourceClassType == "RESOURCECLASS_STRATEGIC" then
                    local playerResources = pPlayer:GetResources()
                    playerResources:ChangeResourceAmount(ResourceType.Index, 15)
                    local playerTechs = pPlayer:GetTech()
                    local EraIndex = Game.GetEras():GetCurrentEra() + 1
                    playerTechs:ChangeCurrentResearchProgress(tonumber(ResourceType.RevealedEra)*tonumber(ResourceType.Frequency)*EraIndex*math.pow(E_CONSTANT,CivParkProperty +2))
                end
                if (ResourceType.ResourceClassType == "RESOURCECLASS_BONUS") or (ResourceType.ResourceClassType == "RESOURCECLASS_LUXURY") then
                    local playerCulture = pPlayer:GetCulture()
                    playerCulture:ChangeCurrentCulturalProgress(2*tonumber(ResourceType.Frequency)*EraIndex*math.pow(E_CONSTANT,CivParkProperty +2))
                end
                if ResourceType.ResourceClassType == "RESOURCECLASS_ARTIFACT" then
                    pPlayer:AttachModifierByID("PPP_RELIC_ON_FIRST_INSPIRATION_gkls621")
                end 
            end
        end
    end
end

function GklsRimiCombatZombiePropertyEditor(killedPlayerID, killedUnitID, playerID, unitID)
    if (killedPlayerID == -1) or (playerID == -1) then return; end
    if (killedUnitID == -1) or (unitID == -1) then return; end
    local pPlayer = Players[playerID]
    if (GklsLeaderMatches(playerID, TYPE_RIMI)) and (pPlayer:IsHuman()) then
        local pUnit = UnitManager.GetUnit(playerID, unitID)      
        if (pUnit:GetType() == RIMI_ZOMBIE_INDEX) then
            local ZombieProperty = Game:GetProperty("RIMI_ZOMBIE_EXTRA_COMBAT_STRENGTH_gkls621") or 0
            if ZombieProperty < 200 then 
                ZombieProperty = ZombieProperty + 3
                Game:SetProperty("RIMI_ZOMBIE_EXTRA_COMBAT_STRENGTH_gkls621", ZombieProperty)
            end
            local seed = math.random(1,100)
            if seed <= 50 then
                local location = pUnit:GetLocation()
                UnitManager.InitUnitValidAdjacentHex(playerID, "UNIT_RIMI_ZOMBIE_gkls621", location.x, location.y, 1)
            end
        elseif GameInfo.Units[pUnit:GetType()].Range > 0 then
            local ZombieProperty = Game:GetProperty("RIMI_ZOMBIE_EXTRA_COMBAT_STRENGTH_gkls621") or 0
            if ZombieProperty < 200 then 
                ZombieProperty = ZombieProperty + 2
                Game:SetProperty("RIMI_ZOMBIE_EXTRA_COMBAT_STRENGTH_gkls621", ZombieProperty)
            end
        end
    end
    local killedUnit = UnitManager.GetUnit(killedPlayerID, killedUnitID)
    local killedPlayer = Players[killedPlayerID]
    if (killedUnit ~= nil) and (GklsLeaderMatches(killedPlayerID, TYPE_RIMI)) and (killedPlayer:IsHuman()) then
        if (killedUnit:GetType() == RIMI_ZOMBIE_INDEX) then
            local ZombieProperty = Game:GetProperty("RIMI_ZOMBIE_EXTRA_COMBAT_STRENGTH_gkls621") or 0
            if ZombieProperty < 200 then 
                ZombieProperty = ZombieProperty + 5
                Game:SetProperty("RIMI_ZOMBIE_EXTRA_COMBAT_STRENGTH_gkls621", ZombieProperty)
            end
        end
    end
end

function GklsRimiOnCityConquered(newPlayerID, oldPlayerID, newCityID, iCityX, iCityY)
    if newPlayerID == -1 or oldPlayerID == -1 then return; end
    if iCityX == -1 or iCityY == -1 then return; end
    if not(GklsLeaderMatches(newPlayerID, TYPE_RIMI)) then return; end
    UnitManager.InitUnitValidAdjacentHex(newPlayerID, "UNIT_RIMI_ZOMBIE_gkls621", iCityX, iCityY, 2)

    local newReligion = Players[newPlayerID]:GetReligion()
    local oldReligion = Players[oldPlayerID]:GetReligion()
    if (newReligion:GetReligionInMajorityOfCities() ~= oldReligion:GetReligionInMajorityOfCities()) then
        Players[newPlayerID]:AttachModifierByID("RIMI_GRANT_CHOCO_CORNET_gkls621")
        UnitManager.InitUnitValidAdjacentHex(newPlayerID, "UNIT_RIMI_ZOMBIE_gkls621", iCityX, iCityY, 2)
    end
end

function GklsRimiOnGreatPersonRecruited(playerID, unitID, greatPersonClassID, greatPersonIndividualID)
    if (playerID == nil) or (unitID == nil) or (greatPersonClassID == -1) then return; end
    if not(GklsLeaderMatches(playerID, TYPE_RIMI)) then return; end
    local pUnit = UnitManager.GetUnit(playerID, unitID)
    if pUnit == nil then return; end
    local location = pUnit:GetLocation()
    UnitManager.InitUnitValidAdjacentHex(playerID, "UNIT_RIMI_ZOMBIE_gkls621", location.x, location.y, 1)
    if(greatPersonClassID == PROPHET_INDEX) or (greatPersonClassID == MUSICIAN_INDEX) then
        UnitManager.InitUnitValidAdjacentHex(playerID, "UNIT_RIMI_ZOMBIE_gkls621", location.x, location.y, 1)
    end
end

--[[function GklsRimiDeadUnitZombified(killedPlayerID, killedUnitID, playerID, unitID)
    if (killedPlayerID == -1) or (playerID == -1) then return; end
    if (killedUnitID == -1) or (unitID == -1) then return; end
    local pUnit = UnitManager.GetUnit(playerID, unitID)
    local location = pUnit:GetLocation()
    local killedPlayer = Players[killedPlayerID]

    local kPlayerDiplo = killedPlayer:GetDiplomacy()
    local possibility = 10
    if GklsLeaderMatches(playerID, TYPE_RIMI) then possibility = possibility + 50; end
    if GklsLeaderMatches(playerID, TYPE_RIMI) and kPlayerDiplo:IsAtWarWith(playerID) then possibility = possibility + 40; end
    if GklsLeaderMatches(playerID, TYPE_RIMI) and kPlayerDiplo:HasAllied(playerID) then possibility = possibility + 30; end
    if GklsLeaderMatches(playerID, TYPE_RIMI) and kPlayerDiplo:HasDeclaredFriendship(playerID) then possibility = possibility + 30; end
    local seed = math.random(1, 100)
    if seed <= possibility then
    end
end]]--

function GklsSetCulture(playerID, civicName, CurrentProgress)
    if playerID == nil or civicName == nil or CurrentProgress == nil then return; end
    local pPlayer = Players[playerID]
    if pPlayer == nil then return; end
    local pCivic = pPlayer:GetCulture()
    if pCivic == nil then return; end
    local civicID = GameInfo.Civics[civicName].Index
    local civicCost = GameInfo.Civics[civicName].Cost
    pCivic:SetCulturalProgress(civicID, CurrentProgress + civicCost*0.1)
    print("civic "..civicName.." gets progressed")
end

function GklsSetTech(playerID, techID)
    if playerID == nil or techName == nil then return; end
    local pPlayer = Players[playerID]
    if pPlayer == nil then return; end
    local pTechs = pPlayer:GetTechs()
    if pTechs == nil then return; end
    pTechs:SetResearchProgress(techID, pTechs:GetResearchCost(techID))
    print("tech "..techID.." set now")
end

    

function GklsPPPInitialise()
    Events.CivicBoostTriggered.Add(GklsPPPRelicOnCivicBoosted)
    Events.CityAddedToMap.Add(GklsPPPRelicIOU)
    Events.DiplomacyMeet.Add(GklsKasumiOnDiplomacyMeet)
    Events.NationalParkAdded.Add(GklsTaeOnNationalParkAdded)
    Events.UnitKilledInCombat.Add(GklsPPPReilcOnInheritorTriumph)
    Events.UnitKilledInCombat.Add(GklsRimiCombatZombiePropertyEditor)
    Events.UnitGreatPersonCreated.Add(GklsRimiOnGreatPersonRecruited)
    --Events.UnitKilledInCombat.Add(GklsRimiDeadUnitZombified)
    GameEvents.CityConquered.Add(GklsRimiOnCityConquered)
    ExposedMembers.GklsPPP = {}
    ExposedMembers.GklsPPP.GklsSetCulture = GklsSetCulture
    ExposedMembers.GklsPPP.GklsSetTech = GklsSetTech
end

Events.LoadGameViewStateDone.Add(GklsPPPInitialise)