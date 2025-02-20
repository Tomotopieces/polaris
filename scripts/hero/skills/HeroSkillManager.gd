# 角色技能管理
class_name HeroSkillManager extends Node

@onready var hero: Hero = $".."

# 动画触发回调
func trigger_callback(index: int) -> void:
    var state = hero.state_machine.current_state
    if not state is HeroStateCast:
        return

    var callbacks := (state as HeroStateCast).skill.trigger_callbacks
    if index < callbacks.size():
        callbacks[index].call()
    else: # 超过数组长度则切换状态
        hero.state_machine.change_state(HeroStateIdle.new(hero))
