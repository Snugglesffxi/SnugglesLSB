-----------------------------------
--  Heat Breath
--
--  Description: Deals fire damage to enemies within a fan-shaped area originating from the caster.
--  Type: Magical (Fire)
--
--
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

    local dmgmod = MobBreathMove(mob, target, 0.5, 1, xi.magic.ele.FIRE, 500)

    local dmg = MobFinalAdjustments(dmgmod, mob, skill, target, xi.attackType.BREATH, xi.damageType.FIRE, MOBPARAM_IGNORE_SHADOWS)

    target:takeDamage(dmg, mob, xi.attackType.BREATH, xi.damageType.FIRE)
    return dmg
end

return mobskill_object
