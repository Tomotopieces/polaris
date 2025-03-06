## 动作化状态
class_name ActionizedState

## 状态名称
var name: StringName

## 状态计时器
var timer: float

## 动作优先级
## 优先级是动态的，可能在运行时改变
## 优先级高的动作可以强制取消优先级低的动作
var priority: int

## 动作是否可取消
## 为true时可以被任意动作取消
var cancellable: bool

func _init(_name: StringName, _priority: int, _cancellable: bool = false) -> void:
	name = _name
	timer = 0
	priority = _priority
	cancellable = _cancellable

## 进入状态
## exit_state: 退出的状态
func enter(_exit_state: ActionizedState) -> void:
	pass

## 更新状态
## delta: 时间增量
func update(delta: float) -> void:
	timer += delta

## 退出状态
func exit() -> void:
	pass
