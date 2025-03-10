## 主角技能派生 普通攻击第三式
class_name HeroDerivationNormalAttack3
extends DerivedWindow

## 主角
var hero: Hero

func _init(_hero: Hero) -> void:
	super()
	hero = _hero

func to_action() -> ActionizedState:
	# 根据是否在地面决定派生动作
	if hero.is_on_floor():
		return HeroStateCast.new(HeroSkillNormalAttackGround3.new(hero))
	else:
		return HeroStateCast.new(HeroSkillNormalAttackAir3.new(hero))
