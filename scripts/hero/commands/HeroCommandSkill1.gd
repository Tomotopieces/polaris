## 主角指令 技能1
class_name HeroCommandSkill1
extends Command

static var NAME := "Skill1"

## 主角
var hero: Hero

func _init(_hero: Hero) -> void:
	super(NAME, CommandPriority.Enum.LOW_PRIORITY_SKILL)
	hero = _hero

func to_action() -> ActionizedState:
	if hero.is_on_floor():
		return HeroStateCast.new(HeroSkillNormalAttackGround1.new(hero))
	else:
		return HeroStateCast.new(HeroSkillNormalAttackAir1.new(hero))
