## 状态机状态
class_name State

# 状态名称
var name: String

# 状态计时器
var timer: float

# 互斥（矛盾）状态
# 在 _init 中初始化，避免二次修改
var paradoxical_states: Array[String]

func _init(name: String) -> void:
    self.name = name
    self.timer = 0
    self.paradoxical_states = ["State"]

# 进入状态
func enter(exit_states: Array[State]) -> void:
    pass

# 更新状态
func update(delta: float) -> void:
    timer += delta

# 推出状态
func exit() -> void:
    pass
