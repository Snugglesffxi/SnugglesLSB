-----------------------------------
-- Area: La Vaule [S]
-- BCNM: Purple, The New Black (WOTG07)
--  Mob: Galarhigg (17125681 or 17125682 or 17125683)
-----------------------------------
require("scripts/globals/battlefield")
require("scripts/globals/missions")
require("scripts/globals/utils")
-----------------------------------
local battlefield_object = {}

battlefield_object.onBattlefieldTick = function(battlefield, tick)
    xi.battlefield.onBattlefieldTick(battlefield, tick)
end

battlefield_object.onBattlefieldRegister = function(player, battlefield)
end

battlefield_object.onBattlefieldEnter = function(player, battlefield)
end

battlefield_object.onBattlefieldLeave = function(player, battlefield, leavecode)
    if leavecode == xi.battlefield.leaveCode.WON then
        local name, clearTime, partySize = battlefield:getRecord()
        utils.unused(name)
        local arg8 = player:hasCompletedMission(xi.mission.log_id.WOTG, xi.mission.id.wotg.PURPLE_THE_NEW_BLACK) and 1 or 0

        player:setLocalVar("battlefieldWin", battlefield:getID())

        player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 1, battlefield:getLocalVar("[cs]bit"), arg8)
    elseif leavecode == xi.battlefield.leaveCode.LOST then
        player:startEvent(32002)
    end
end

battlefield_object.onEventUpdate = function(player, csid, option)
end

battlefield_object.onEventFinish = function(player, csid, option)
end

return battlefield_object
