-----------------------------------
-- Spring Breeze
--
-- Description: AoE TP-Reduction and Sleep xi.effect.
-----------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/settings/main")
require("scripts/globals/status")
-----------------------------------
local mobskill_object = {}

mobskill_object.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskill_object.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(MobStatusEffectMove(mob, target, xi.effect.SLEEP_I, 1, 0, 20))
    target:setTP(target:getTP() * 0.5)

    return xi.effect.SLEEP_I
end

return mobskill_object
