## 技能
class_name Skill

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
func start() -> void:
	pass

## 结束技能流程
func end() -> void:
	pass
