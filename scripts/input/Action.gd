## 动作
class_name Action

# 动作名称
var name: String

# 动作优先级
# 优先级是动态变化的，可能在运行时改变
# 优先级高的动作可以强制取消优先级低的动作
var priority: int = 0

# 动作是否可取消
# 可取消的动作可以任意其他动作取消
var cancellable: bool = false

func _init(_name: String) -> void:
    name = _name

# 执行
func execute() -> void:
    pass
