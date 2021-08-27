-----------------------------------
-- Area: Port Jeuno
--  NPC: Door: Departures Exit (for Bastok)
-- !pos -61 7 -54 246
-----------------------------------
require("scripts/settings/main")
require("scripts/globals/keyitems")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if (player:hasKeyItem(xi.ki.AIRSHIP_PASS) == true and player:getGil() >= 200) then
        player:startEvent(36)
    else
        player:startEvent(44)
    end
    return 1
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)

    if (csid == 36) then
        local Z = player:getZPos()

        if (Z >= -61 and Z <= -58) then
            player:delGil(200)
        end
    end

end

return entity
