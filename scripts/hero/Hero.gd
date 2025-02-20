class_name Hero
extends CharacterBody2D
## 玩家角色

#region 常量

# 水平移动速度
const SPEED = 160.0

# 跳跃加速度
const JUMP_VELOCITY = -320.0

#endregion

#region 组件

# 图形管理节点
@onready var graphic: Node2D = $Graphic

# 动画机
@onready var animation_player: AnimationPlayer = $AnimationPlayer

#endregion

#region 属性

# 角色朝向
# 1为右，-1为左
var direction := 1:
    set = set_direction

# 状态机
var state_machine: StateManchine

#endregion

func _ready() -> void:
    state_machine = StateManchine.new()
    state_machine.change_state(HeroStateIdle.new(self))

func _physics_process(delta: float) -> void:
    # 重力
    velocity += get_gravity() * delta

    # 朝向
    self.direction = 1 if velocity.x > 0 else -1 if velocity.x < 0 else 0

    move_and_slide()

    # 状态更新
    state_machine.update(delta)

func set_direction(value: int) -> void:
    if direction == value or value == 0:
        return

    direction = value
    graphic.scale.x = direction
