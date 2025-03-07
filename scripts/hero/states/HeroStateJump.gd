## 主角状态 跳跃
class_name HeroStateJump extends ActionizedState

static var NAME := "Jump"

## 主角
var hero: Hero

## 是否是通过指令进入的
## 若通过指令进入的该状态，则执行基本的跳跃逻辑
var enter_by_command: bool

func _init(_hero: Hero, _enter_by_command: bool = true) -> void:
	super(NAME, StatePriority.Enum.AIR, true)
	hero = _hero
	enter_by_command = _enter_by_command

func enter(_exit_state: ActionizedState) -> void:
	if enter_by_command:
		var jump_from_floor := hero.jump()
		hero.animation_player.play("jumping" if jump_from_floor else "double_jumping")
	else:
		hero.animation_player.play("rising") # 只有上升部分的循环动画，没有起跳动作

func update(delta: float) -> void:
	super(delta)

	if hero.velocity.y > 0: # 进入下落状态
		hero.state_machine.change_state(HeroStateFall.new(hero))
