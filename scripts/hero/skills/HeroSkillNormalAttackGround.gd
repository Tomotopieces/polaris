## 主角技能 普通攻击
class_name HeroSkillNormalAttackGround
extends Skill

func _init(_hero: Hero) -> void:
	super(_hero, StatePriority.Enum.LOW_PRIORITY_CAST)
	self.trigger_callbacks = [enable_damage_field, disable_damage_field]

func start() -> void:
	hero.allow_move = false
	hero.animation_player.play("normal_attack_ground_1")
	hero.velocity = Vector2(0, 0)
	hero.gravity_ratio = 0.05

func end() -> void:
	hero.gravity_ratio = 1

## 开启伤害判定范围
var enable_damage_field := func () -> void:
	pass # TODO

## 关闭伤害判定范围
var disable_damage_field := func () -> void:
	hero.allow_move = true # TODO
