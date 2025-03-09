## 派生动作输入窗口
## 与指令类似，但由动作创建而非输入发起
## 开启输入窗口，当指令命中时，可指定动作
class_name DerivedWindow

## 默认有效时间
static var DEFAULT_VALID_WINDOW: float = 0.5

## 失效时间
var expire_time: float

## 动作
var action: ActionizedState

func _init(_action: ActionizedState, _valid_window: float = DEFAULT_VALID_WINDOW) -> void:
	action = _action
	expire_time = Time.get_ticks_msec() / 1000.0 + _valid_window

## 是否有效
## Returns: 是否超过过期时间
func is_valid() -> bool:
	return Time.get_ticks_msec() / 1000.0 < expire_time
