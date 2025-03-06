## 主角状态 闲置
class_name HeroStateIdle
extends ActionizedState

static var NAME := "Idle"

## 主角
var hero: Hero

func _init(_hero: Hero) -> void:
	super(NAME, StatePriority.Enum.GROUND, true)
	hero = _hero

func enter(exit_state: ActionizedState) -> void:
	# 播放着陆或闲置动画
	hero.animation_player.play("landing" if exit_state.name == HeroStateFall.NAME else "idling")

func update(delta: float) -> void:
	super(delta)

	if not hero.animation_player.is_playing(): # 着陆动画结束后播放闲置动画
		hero.animation_player.play("idling")

	if not is_zero_approx(hero.velocity.x): # 进入跑动状态
		hero.state_machine.change_state(HeroStateRun.new(hero))
	
	if not is_zero_approx(hero.velocity.y): # 进入下落状态
		hero.state_machine.change_state(HeroStateFall.new(hero))
