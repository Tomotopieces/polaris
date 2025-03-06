## 指令管理器
class_name CommandManager
extends Node

## 主角
@onready var hero: Hero = $"../Hero"

## 指令预输入缓冲区
var buffer: Array[Command] = []

func _physics_process(_delta: float) -> void:
	# 清理过期指令
	buffer = buffer.filter(func(cmd: Command) -> bool: return cmd.is_valid())
	if buffer.is_empty():
		return

	# 处理有效指令
	var to_remove: Array[Command] = []
	for cmd in buffer:
		var state := cmd.to_state()
		if state:
			continue
		if hero.state_machine.change_state(state):
			to_remove.push_back(cmd)
	buffer.filter(func(cmd: Command) -> bool: return to_remove.has(cmd)) # 移除指令

## 添加指令至缓冲区
## command: 指令
func push_command(command: Command) -> void:
	buffer.push_back(command)
	# 优先级高的排在前面，相同优先级保持原有顺序
	buffer.sort_custom(func(a: Command, b: Command) -> bool: return a.priority > b.priority)

## 删除指令
## command_name: 指令名称
func remove_command(command_name: String) -> void:
	buffer = buffer.filter(func(cmd: Command) -> bool: return cmd.name != command_name)
