## 输入管理
class_name InputManager
extends Node

#region 引用组件

# 主角
@onready var hero: Hero = $"../Hero"

# 指令管理器
var command_manager: CommandManager

#endregion

func _ready() -> void:
	command_manager = hero.command_manager

func _physics_process(_delta: float) -> void:
	# 判断场景，选择输入策略
	if get_tree().paused:
		esc_menu_strategy()
	else:
		action_strategy()

## 动作场景输入策略
func action_strategy() -> void:
	# 退出
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().paused = true

	# 普通攻击
	if Input.is_action_just_pressed("skill_1"):
		command_manager.push_command(HeroCommandSkill1.new(hero))

	# 跳跃
	if Input.is_action_just_pressed("move_jump"):
		command_manager.push_command(HeroCommandJump.new(hero))

	# 水平移动（非指令）
	hero.horizontal_move(Input.get_axis("move_left", "move_right")) # 水平移动在非跑动状态下也会进行

## 暂停菜单场景输入策略
func esc_menu_strategy() -> void:
	# 恢复
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().paused = false
