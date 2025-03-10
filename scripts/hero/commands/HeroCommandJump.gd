## 主角指令 跳跃
class_name HeroCommandJump
extends Command

static var NAME := "Jump"

## 主角
var hero: Hero

func _init(_hero: Hero) -> void:
	super(NAME, CommandPriority.Enum.JUMP)
	hero = _hero

func to_action() -> ActionizedState:
	return HeroStateJump.new(hero) if hero.can_jump() else null
