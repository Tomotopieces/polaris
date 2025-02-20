## 输入管理
class_name InputManager
extends Node

#region 引用组件

# 玩家角色
@onready var hero: Hero = $"../Hero"

#endregion

func _physics_process(delta: float) -> void:
    # 判断场景，选择输入策略
    if get_tree().paused:
        esc_menu_strategy()
    else:
        action_strategy()

# 动作场景输入策略
func action_strategy() -> void:
    # 退出
    if Input.is_action_just_pressed("ui_cancel"):
        get_tree().paused = true

    # 跳跃
    if Input.is_action_just_pressed("move_jump") and hero.can_jump():
        hero.state_machine.change_state(HeroStateJump.new(hero))

    # 水平移动
    var direction := Input.get_axis("move_left", "move_right")
    if direction:
        hero.velocity.x = direction * hero.SPEED
    else:
        hero.velocity.x = move_toward(hero.velocity.x, 0, hero.SPEED)

# 暂停菜单场景输入策略
func esc_menu_strategy() -> void:
    # 恢复
    if Input.is_action_just_pressed("ui_cancel"):
        get_tree().paused = false
