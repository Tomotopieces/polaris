## 状态机
class_name StateManchine

# 当前状态
var current_state: State

func _init() -> void:
    current_state = CommonStateInit.new() # 设置通用初始状态

# 更新状态
func update(delta: float) -> void:
    current_state.update(delta)

# 切换状态
func change_state(state: State) -> void:
    var exit_state = current_state
    exit_state.exit()
    current_state = state
    current_state.enter(exit_state)
