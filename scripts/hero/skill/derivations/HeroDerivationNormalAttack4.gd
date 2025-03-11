## 主角技能派生 普通攻击第三式
class_name HeroDerivationNormalAttack4
extends DerivedWindow

## 主角
var hero: Hero

func _init(_hero: Hero) -> void:
	super()
	hero = _hero

func to_action() -> ActionizedState:
	return HeroStateCast.new(HeroSkillNormalAttack4.new(hero))
