## 指令管理器
class_name CommandManager extends Node

# 玩家角色
@onready var hero: Hero = $"../Hero"

# 指令预输入缓冲区
var buffer: Array[Command] = []

# 当前动作
var current_action: Action

# 缓冲指令
func push_command(cmd: Command) -> void:
    buffer.push_back(cmd)
    # 根据指令优先级排序
    buffer.sort_custom(func(a: Command, b: Command) -> bool:
        # 优先级高的排在前面，相同优先级保持原有顺序
        return a.priority > b.priority
    )

func _physics_process(_delta: float) -> void:
    # 清理过期指令
    buffer = buffer.filter(func(cmd: Command) -> bool: return cmd.is_valid())
    if buffer.is_empty():
        return

    # 处理有效指令
    for cmd in buffer:
        pass

# 指令转动作
func command_to_Action(cmd: Command) -> Action:
    return null

