## 主角技能 空中普通攻击3式（落地斩）
class_name HeroSkillNormalAttackAir3
extends Skill

func _init(_hero: Hero) -> void:
	super(_hero, StatePriority.Enum.LOW_PRIORITY_CAST)
	trigger_callbacks = [callback_0, callback_1, callback_2, callback_3]

func enter() -> void:
	hero.animation_player.stop()
	hero.animation_player.play("normal_attack_air_3_1")
	hero.velocity = Vector2(0, 0)
	hero.gravity_ratio = 0.1
	hero.horizontal_move_ratio = 0.1

func update(_delta: float) -> void:
	# 下落阶段动画为循环播放，通过update判断是否落地
	if hero.is_on_floor():
		hero.animation_player.play("normal_attack_air_3_3")

func exit() -> void:
	hero.gravity_ratio = 1
	hero.horizontal_move_ratio = 1

var callback_0 := func () -> void:
	hero.gravity_ratio = 2.5
	hero.horizontal_move_ratio = 0
	# TODO 开启伤害判定范围1
	pass

var callback_1 := func () -> void:
	# 进入下落阶段
	hero.animation_player.play("normal_attack_air_3_2")

var callback_2 := func () -> void:
	# TODO 关闭伤害判定范围1，开启伤害判定范围2
	pass

var callback_3 := func () -> void:
	hero.state_machine.current_state.cancellable = true
	# TODO 关闭伤害判定范围2
