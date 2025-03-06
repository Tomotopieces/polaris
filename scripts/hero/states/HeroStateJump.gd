## 主角状态 跳跃
class_name HeroStateJump extends ActionizedState

static var NAME := "Jump"

## 主角
var hero: Hero

func _init(_hero: Hero) -> void:
	super(NAME, StatePriority.Enum.AIR, true)
	hero = _hero
	# TODO 将 Jump 拆分成起跳阶段的 Jump 和持续爬升阶段的 Rise ，以便非指令进入的情况可以进入 Rise 状态
	# TODO 将状态名统一改为 ing 形式

func enter(_exit_state: ActionizedState) -> void:
	hero.jump_chance -= 1
	hero.velocity.y = hero.JUMP_VELOCITY
	hero.animation_player.play("jumping")

func update(delta: float) -> void:
	super(delta)

	if is_zero_approx(hero.velocity.y): # 进入下落状态
		hero.state_machine.change_state(HeroStateFall.new(hero))
