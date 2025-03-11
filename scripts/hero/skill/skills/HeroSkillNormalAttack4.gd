## 主角技能 空中普通攻击4式（狮子斩）
## 只能通过空中3式（落地斩）进行派生
class_name HeroSkillNormalAttack4
extends Skill

func _init(_hero: Hero) -> void:
	super(_hero, StatePriority.Enum.LOW_PRIORITY_CAST)
	trigger_callbacks = [callback_0, callback_1, callback_2]

func enter() -> void:
	hero.animation_player.stop()
	hero.animation_player.play("normal_attack_4")
	hero.velocity = Vector2(0, 0)
	hero.allow_move = false

func exit() -> void:
	hero.gravity_ratio = 1
	hero.allow_move = true

var callback_0 := func () -> void:
	# 跳起
	hero.velocity.x = 180 * hero._direction
	hero.velocity.y = -340
	# TODO 进入高韧性状态
	pass

var callback_1 := func () -> void:
	hero.gravity_ratio = 3.5
	hero.velocity.x = 0
	# TODO 开启伤害判定范围
	pass

var callback_2 := func () -> void:
	hero.state_machine.current_state.cancellable = true
	# TODO 退出高韧性状态，关闭伤害判定范围
	pass
