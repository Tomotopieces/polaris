## 状态机
class_name StateMachine

## 当前状态
var current_state: ActionizedState

func _init() -> void:
	current_state = CommonStateInit.new() # 设置通用初始状态

## 更新状态
## delta: 时间增量
func update(delta: float) -> void:
	current_state.update(delta)

## 切换状态
## state: 新状态
## Returns: 是否应该移除对应指令
func change_state(state: ActionizedState) -> bool:
	# 若新状态优先级高于现有状态，或现有状态可被取消，则切换至新状态，否则切换失败
	if not (state.priority > current_state.priority or current_state.cancellable):
		return false

	# 更新状态
	var exit_state := current_state
	exit_state.exit()
	current_state = state
	current_state.enter(exit_state)
	
	return true
