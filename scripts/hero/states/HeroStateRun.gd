## 主角状态 跑动
## 实际的水平移动由 Hero 自行处理，此处只负责动画播放与状态切换
class_name HeroStateRun
extends ActionizedState

static var NAME := "Run"

## 主角
var hero: Hero

func _init(_hero: Hero) -> void:
	super(NAME, StatePriority.Enum.GROUND, true)
	hero = _hero

func enter(_exit_state: ActionizedState) -> void:
	hero.animation_player.play("running")

func update(delta: float) -> void:
	super(delta)
	
	if is_zero_approx(hero.velocity.x): # 进入闲置状态
		hero.state_machine.change_state(HeroStateIdle.new(hero))
	
	if not is_zero_approx(hero.velocity.y): # 进入下落状态
		hero.state_machine.change_state(HeroStateFall.new(hero))
