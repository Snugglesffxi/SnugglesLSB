-----------------------------------
--  Eyes on Me
--  Deals dark damage to an enemy.
--  Spell Type: Magical (Dark)
--  Range: Casting range 13'
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
    local dmgmod = mob:getWeaponDmg() * 4

    local dmg = MobFinalAdjustments(dmgmod, mob, skill, target, xi.attackType.SPECIAL, xi.damageType.DARK, MOBPARAM_IGNORE_SHADOWS)

    target:takeDamage(dmg, mob, xi.attackType.SPECIAL, xi.damageType.DARK)

    return dmg
end

return mobskill_object
