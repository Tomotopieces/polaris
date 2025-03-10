## 主角技能 监控中普通攻击2式
class_name HeroSkillNormalAttackAir2
extends Skill

func _init(_hero: Hero) -> void:
	super(_hero, StatePriority.Enum.LOW_PRIORITY_CAST)
	trigger_callbacks = [callback_0, callback_1, callback_2]

func enter() -> void:
	hero.animation_player.stop()
	hero.animation_player.play("normal_attack_air_2")
	hero.velocity = Vector2(0, 0)
	hero.gravity_ratio = 0.1
	hero.horizontal_move_ratio = 0.1

func exit() -> void:
	hero.gravity_ratio = 1
	hero.horizontal_move_ratio = 1

var callback_0 := func () -> void:
	# TODO 开启伤害判定范围
	pass

var callback_1 := func () -> void:
	# TODO 关闭伤害判定范围
	pass

var callback_2 := func () -> void:
	hero.command_manager.open_window(HeroCommandSkill1.NAME, HeroDerivationNormalAttack3.new(hero))
	hero.state_machine.current_state.cancellable = true # 进入可取消状态
