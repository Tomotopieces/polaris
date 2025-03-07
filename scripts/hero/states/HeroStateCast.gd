## 主角状态 使用技能
class_name HeroStateCast
extends ActionizedState

static var NAME := "Cast"

# 主角
var hero: Hero

# 技能
var skill: Skill

func _init(_hero: Hero, _skill: Skill) -> void:
	super(NAME, _skill.priority)
	hero = _hero
	skill = _skill

func enter(_exit_state: ActionizedState) -> void:
	skill.start()

func update(delta: float) -> void:
	super(delta)

func exit() -> void:
	skill.end()
