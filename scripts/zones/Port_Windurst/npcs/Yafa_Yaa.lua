-----------------------------------
-- Area: Port Windurst
--  NPC: Yafa Yaa
-----------------------------------
require("scripts/globals/quests")
require("scripts/settings/main")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)

end

entity.onTrigger = function(player, npc)

    local TruthJusticeOnionWay = player:getQuestStatus(xi.quest.log_id.WINDURST, xi.quest.id.windurst.TRUTH_JUSTICE_AND_THE_ONION_WAY)
    local KnowOnesOnions       = player:getQuestStatus(xi.quest.log_id.WINDURST, xi.quest.id.windurst.KNOW_ONE_S_ONIONS)
    local InspectorsGadget     = player:getQuestStatus(xi.quest.log_id.WINDURST, xi.quest.id.windurst.INSPECTOR_S_GADGET)
    local OnionRings           = player:getQuestStatus(xi.quest.log_id.WINDURST, xi.quest.id.windurst.ONION_RINGS)
    local CryingOverOnions     = player:getQuestStatus(xi.quest.log_id.WINDURST, xi.quest.id.windurst.CRYING_OVER_ONIONS)
    local ThePromise = player:getQuestStatus(xi.quest.log_id.WINDURST, xi.quest.id.windurst.THE_PROMISE)

    if (ThePromise == QUEST_COMPLETED) then
        local Message = math.random(0, 1)

        if (Message == 1) then
            player:startEvent(538)
        else
            player:startEvent(526)
        end
    elseif (ThePromise == QUEST_ACCEPTED) then
        player:startEvent(516)
    elseif (CryingOverOnions == QUEST_COMPLETED) then
        player:startEvent(506)
    elseif (CryingOverOnions == QUEST_ACCEPTED) then
        player:startEvent(499)
    elseif (OnionRings == QUEST_COMPLETED) then
        player:startEvent(444)
    elseif (OnionRings == QUEST_ACCEPTED ) then
        player:startEvent(436)
    elseif (InspectorsGadget == QUEST_COMPLETED) then
        player:startEvent(427)
    elseif (InspectorsGadget == QUEST_ACCEPTED) then
        player:startEvent(419)
    elseif (KnowOnesOnions == QUEST_COMPLETED) then
        player:startEvent(407)
    elseif (KnowOnesOnions == QUEST_ACCEPTED) then
        local KnowOnesOnionsVar  = player:getCharVar("KnowOnesOnions")

        if (KnowOnesOnionsVar == 2) then
            player:startEvent(406)
        else
            player:startEvent(397)
        end
    elseif (TruthJusticeOnionWay == QUEST_COMPLETED) then
        player:startEvent(383)
    elseif (TruthJusticeOnionWay == QUEST_ACCEPTED) then
        player:startEvent(376)
    else
        player:startEvent(365)
    end

end

entity.onEventUpdate = function(player, csid, option)
    -- printf("CSID2: %u", csid)
    -- printf("RESULT2: %u", option)

end

entity.onEventFinish = function(player, csid, option)

end

return entity
