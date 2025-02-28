## 输入指令
class_name Command

# 默认有效时间
static var DEFAULT_VALID_WINDOW: float = 0.2

# 指令
var command: String

# 优先级
# 影响指令队列排序
var priority: int;

# 失效时间
var expire_time: float

func _init(_command: String, _priority: int, valid_window: float = DEFAULT_VALID_WINDOW) -> void:
    command = _command
    priority = _priority
    expire_time = Time.get_ticks_msec() / 1000.0 + valid_window

# 是否有效
func is_valid() -> bool:
    return Time.get_ticks_msec() / 1000.0 < expire_time
