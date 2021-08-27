-----------------------------------
--  Voiceless Storm
--  Description: AOE Damage, Silence, strips Utsusemi (MOBPARAM_WIPE_SHADOWS)
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
    local typeEffect = xi.effect.SILENCE

    local numhits = 1
    local accmod = 1
    local dmgmod = 1
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.PHYSICAL, xi.damageType.NONE, MOBPARAM_WIPE_SHADOWS)

    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 1, 0, 60)

    target:takeDamage(dmg, mob, xi.attackType.PHYSICAL, xi.damageType.NONE)
    return dmg
end

return mobskill_object
