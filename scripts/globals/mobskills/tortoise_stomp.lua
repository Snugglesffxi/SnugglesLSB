-----------------------------------
--  Tortoise Stomp
--
--  Description: Single target Defense Down xi.effect.
--  Type: Physical
--  Utsusemi/Blink absorb:&nbsp??
--  Range: Varying Area of Effect
--  Notes:
-----------------------------------
require("scripts/settings/main")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
-----------------------------------
local mobskill_object = {}

mobskill_object.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskill_object.onMobWeaponSkill = function(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local dmgmod = 2.8
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.PHYSICAL, xi.damageType.BLUNT, info.hitslanded)

    local typeEffect = xi.effect.DEFENSE_DOWN
    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 30, 0, 180)

    target:takeDamage(dmg, mob, xi.attackType.PHYSICAL, xi.damageType.BLUNT)
    return dmg
end

return mobskill_object
