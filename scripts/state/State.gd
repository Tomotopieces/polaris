## 状态机状态
class_name State

# 状态名称
var name: String

# 状态计时器
var timer: float

func _init(name: String) -> void:
    self.name = name
    self.timer = 0

# 进入状态
func enter(exit_state: State) -> void:
    pass

# 更新状态
func update(delta: float) -> void:
    timer += delta

# 退出状态
func exit() -> void:
    pass
