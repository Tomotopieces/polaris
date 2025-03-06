## 主角状态协助工具
class_name HeroStateHelper

## 获取当前所属的自然状态
static func natural_state(hero: Hero) -> ActionizedState:
	if hero.is_on_floor():
		if is_zero_approx(hero.velocity.x):
			return HeroStateIdle.new(hero)
		else:
			return HeroStateRun.new(hero)
	elif hero.velocity.y < 0:
		return HeroStateJump.new(hero)
	else:
		return HeroStateFall.new(hero)
