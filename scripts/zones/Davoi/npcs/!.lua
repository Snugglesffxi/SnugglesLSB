-----------------------------------
-- Area: Davoi
--  NPC: !
-- Involved in Mission: The Davoi Report
-- !pos 164 0.1 -21 149
-----------------------------------
require("scripts/globals/missions")
require("scripts/globals/keyitems")
local ID = require("scripts/zones/Davoi/IDs")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local currentMission = player:getCurrentMission(SANDORIA)
    local missionStatus = player:getMissionStatus(player:getNation())

    if currentMission == xi.mission.id.sandoria.INFILTRATE_DAVOI and missionStatus >= 6 and missionStatus <= 9 then
        local X = npc:getXPos()
        local Z = npc:getZPos()

        if X >= 292 and X <= 296 and Z >= -30 and Z <= -26 and not player:hasKeyItem(xi.ki.EAST_BLOCK_CODE) then
            player:setMissionStatus(player:getNation(), missionStatus + 1)
            player:addKeyItem(xi.ki.EAST_BLOCK_CODE)
            player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.EAST_BLOCK_CODE)
        elseif X >= 333 and X <= 337 and Z >= -138 and Z <= -134 and not player:hasKeyItem(xi.ki.SOUTH_BLOCK_CODE) then
            player:setMissionStatus(player:getNation(), missionStatus + 1)
            player:addKeyItem(xi.ki.SOUTH_BLOCK_CODE)
            player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.SOUTH_BLOCK_CODE)
        elseif X >= 161 and X <= 165 and Z >= -20 and Z <= -16 and not player:hasKeyItem(xi.ki.NORTH_BLOCK_CODE) then
            player:setMissionStatus(player:getNation(), missionStatus + 1)
            player:addKeyItem(xi.ki.NORTH_BLOCK_CODE)
            player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.NORTH_BLOCK_CODE)
        else
            player:messageSpecial(ID.text.YOU_SEE_NOTHING)
        end
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
