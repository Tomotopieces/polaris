## 指令
class_name Command

## 默认有效时间
static var DEFAULT_VALID_TIME: float = 0.15

## 指令
var name: String

## 优先级
## 影响指令队列排序
var priority: int;

## 失效时间
var expire_time: float

func _init(_name: String, _priority: int, _valid_time: float = DEFAULT_VALID_TIME) -> void:
	name = _name
	priority = _priority
	expire_time = Time.get_ticks_msec() / 1000.0 + _valid_time

## 是否有效
## Returns: 是否超过过期时间
func is_valid() -> bool:
	return Time.get_ticks_msec() / 1000.0 < expire_time

## 转为动作（状态）
## Returns: 动作（状态），可能为null
func to_action() -> ActionizedState:
	assert(false, "Not Implemented") # 所有子类都需要实现此方法
	return null
