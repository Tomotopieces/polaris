## 玩家技能 普通攻击
class_name HeroSkillNormalAttack extends Skill

func _init(hero: Hero) -> void:
    super(hero)
    self.trigger_callbacks = [enable_damage_field, disable_damage_field]

func start() -> void:
    hero.allow_jump = false
    hero.animation_player.play("normal_attack")

# 开启伤害判定范围
var enable_damage_field = func () -> void:
    pass
    # TODO

# 关闭伤害判定范围
var disable_damage_field = func () -> void:
    hero.allow_jump = true
    # TODO
