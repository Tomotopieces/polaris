## 状态机
class_name StateManchine

# 当前状态
var current_states: Array[State]

# 更新状态
func update(delta: float) -> void:
    for state in current_states:
        state.update(delta)

# 添加状态
func add_state(state: State) -> void:
    # 查询并退出互斥状态
    var removed: Array[State] = []
    for existing_state in current_states:
        for paradox in state.paradoxical_states:
            if existing_state.is_class(paradox):
                existing_state.exit()
                current_states.erase(existing_state)
                removed.push_back(existing_state)

    # 添加并进入新状态
    current_states.push_back(state)
    state.enter(removed)
