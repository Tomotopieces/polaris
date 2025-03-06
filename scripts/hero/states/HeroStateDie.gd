## 主角状态 死亡
class_name HeroStateDie
extends ActionizedState

static var NAME := "Die"

## 主角
var hero: Hero

func _init(_hero: Hero) -> void:
	super(NAME, StatePriority.Enum.DIE)
	hero = _hero

func enter(_exit_state: ActionizedState) -> void:
	hero.animation_player.play("dying")

func update(delta: float) -> void:
	super(delta)
	if not hero.animation_player.is_playing():
		pass # TODO 死亡结算
