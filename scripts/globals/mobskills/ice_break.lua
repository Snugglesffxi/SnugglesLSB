-----------------------------------
-- Ice Break
-- Deals ice damage to enemies within range. Additional Effect: "Bind."
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
    local typeEffect = xi.effect.BIND

    MobStatusEffectMove(mob, target, typeEffect, 1, 0, 30)

    local dmgmod = 1
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*3, xi.magic.ele.ICE, dmgmod, TP_MAB_BONUS, 1)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.MAGICAL, xi.damageType.ICE, MOBPARAM_WIPE_SHADOWS)
    target:takeDamage(dmg, mob, xi.attackType.MAGICAL, xi.damageType.ICE)
    return dmg
end

return mobskill_object
