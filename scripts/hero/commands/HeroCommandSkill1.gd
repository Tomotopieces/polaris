## 主角指令 技能1
class_name HeroCommandSkill1
extends Command

static var NAME := "Skill1"

## 主角
var hero: Hero

func _init(_hero: Hero) -> void:
	super(NAME, CommandPriority.Enum.LOW_PRIORITY_SKILL)
	hero = _hero

func to_state() -> ActionizedState:
	# TODO 判断当前为第几式
	return HeroStateCast.new(hero, HeroSkillNormalAttack1.new(hero))
