## 指令管理器
class_name CommandManager
extends Node

## 主角
var hero: Hero

## 指令预输入缓冲区
var preinput_buffer: Array[Command] = []

## 派生窗口记录
## 指令名 -> DerivedWindow
var command_window_map: Dictionary = {}

func _init(_hero: Hero) -> void:
	hero = _hero

func update(_delta: float) -> void:
	# 清理过期派生标靶
	for key in command_window_map.keys():
		if not (command_window_map[key] as DerivedWindow).is_valid():
			command_window_map.erase(key)
	
	# 清理过期指令
	preinput_buffer = preinput_buffer.filter(func(cmd: Command) -> bool: return cmd.is_valid())
	if preinput_buffer.is_empty():
		return

	# 处理有效指令
	var consumed: Array[Command] = []
	for cmd in preinput_buffer:
		# 若指令命中派生窗口，则为派生动作，否则正常判断
		var window := command_window_map.get(cmd.name) as DerivedWindow
		var state: ActionizedState = window.to_action() if window else cmd.to_action()
		if not state:
			continue

		# 执行动作，移除指令与标靶
		if hero.state_machine.change_state(state):
			consumed.push_back(cmd)
			if window:
				command_window_map.erase(cmd.name)

	# 移除指令
	for cmd in consumed:
		preinput_buffer.erase(cmd)

## 添加指令至缓冲区
## command: 指令
func push_command(command: Command) -> void:
	preinput_buffer.push_back(command)
	# 优先级高的排在前面，相同优先级保持原有顺序
	preinput_buffer.sort_custom(func(a: Command, b: Command) -> bool: return a.priority > b.priority)

## 开启派生窗口
## command_name: 指令名
## window: 窗口
func open_window(command_name: String, window: DerivedWindow) -> void:
	command_window_map[command_name] = window
