## 主角状态 下落
class_name HeroStateFall
extends ActionizedState

static var NAME := "Fall"

## 主角
var hero: Hero

func _init(_hero: Hero) -> void:
	super(NAME, StatePriority.Enum.AIR, true)
	hero = _hero

func enter(exit_state: ActionizedState) -> void:
	# 若从地面状态进入下落状态，则开始土狼跳计时
	if exit_state.priority == StatePriority.Enum.GROUND:
		hero.coyote_jump_timer.start()
	hero.animation_player.play("falling")

func update(delta: float) -> void:
	super(delta)

	if hero.is_on_floor():
		# 着陆时根据水平速度判断进入闲置还是跑动
		if is_zero_approx(hero.velocity.x):
			hero.state_machine.change_state(HeroStateIdle.new(hero))
		else:
			hero.state_machine.change_state(HeroStateRun.new(hero))
