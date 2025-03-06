## 角色技能管理
class_name HeroSkillManager
extends Node

## 主角
@onready var hero: Hero = $".."

## 动画触发回调
## index: 回调序号
func trigger_callback(index: int) -> void:
	var state := hero.state_machine.current_state
	if not state is HeroStateCast:
		assert(false, "impossible situation") # ALERT 若发生此情况则需要检查技能效果触发链路
		return

	var skill := (state as HeroStateCast).skill
	var callbacks := skill.trigger_callbacks
	if index < callbacks.size():
		callbacks[index].call()
	else: # 超过数组长度则切换状态
		skill.end()
		hero.state_machine.change_state(HeroStateIdle.new(hero))
