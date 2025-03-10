## 主角状态 使用技能
class_name HeroStateCast
extends ActionizedState

static var NAME := "Cast"

# 技能
var skill: Skill

func _init(_skill: Skill) -> void:
	super(NAME, _skill.priority)
	skill = _skill

func enter(_exit_state: ActionizedState) -> void:
	skill.enter()

func update(delta: float) -> void:
	super(delta)
	skill.update(delta)

func exit() -> void:
	skill.exit()
