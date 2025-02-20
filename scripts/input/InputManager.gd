## 输入管理
class_name InputManager
extends Node

#region 引用组件

# 玩家角色
@onready var hero: Hero = $"../Hero"

#endregion

func _physics_process(delta: float) -> void:
    if hero.is_on_floor() and Input.is_action_just_pressed("move_jump"):
        hero.state_machine.change_state(HeroStateJump.new(hero))

    var direction := Input.get_axis("move_left", "move_right")
    if direction:
        hero.velocity.x = direction * hero.SPEED
    else:
        hero.velocity.x = move_toward(hero.velocity.x, 0, hero.SPEED)
