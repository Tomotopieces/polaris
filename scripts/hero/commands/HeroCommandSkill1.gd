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
    return HeroStateCast.new(hero, HeroSkillNormalAttackGround.new(hero)) # TODO 判断地面或空中
