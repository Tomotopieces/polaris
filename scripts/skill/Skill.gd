## 技能
class_name Skill

## 主角
var hero: Hero

## 技能优先级
var priority: int

## 动画帧事件触发回调函数列表
## 类型皆需为 () -> void
var trigger_callbacks: Array[Callable]

func _init(_hero: Hero, _priority: StatePriority.Enum) -> void:
	hero = _hero
	trigger_callbacks = []

## 开始技能流程
func enter() -> void:
	pass

## 技能更新
## delta: 时间增量
@warning_ignore("unused_parameter")
func update(delta: float) -> void:
	pass

## 结束技能流程
func exit() -> void:
	pass
