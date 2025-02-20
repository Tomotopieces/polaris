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

# 土狼跳计时器
# 允许玩家在离开地面后的一小段时间内进行跳跃
# 从地面状态直接进入下落状态后开始计时
@onready var coyote_jump_timer: Timer = $CoyoteJumpTimer

#endregion

#region 属性

# 角色朝向
# 1为右，-1为左
var direction := 1:
    set = set_direction

# 状态机
var state_machine: StateManchine

# 最大跳跃次数
var max_jump_chance := 1

# 可用跳跃次数
var jump_chance := 0

# 当前是否允许跳跃
var allow_jump := true

# 当前是否忽视重力
var ignore_gravity := false
#endregion

func _ready() -> void:
    state_machine = StateManchine.new()
    state_machine.change_state(HeroStateIdle.new(self))

func _physics_process(delta: float) -> void:
    if not ignore_gravity:
        velocity += get_gravity() * delta # 重力
    self.direction = 1 if velocity.x > 0 else -1 if velocity.x < 0 else 0 # 朝向
    move_and_slide() # 物理状态
    state_machine.update(delta) # 状态机

# 角色朝向 setter
func set_direction(value: int) -> void:
    if direction == value or value == 0:
        return

    direction = value
    graphic.scale.x = direction # 通过变更 graphic 的 scale.x 来改变朝向，避免图片的 offset 导致的错位

# 是否可以跳跃
func can_jump() -> bool:
    # 在地面或在土狼跳时间内，有剩余的跳跃次数，且当前状态允许进行跳跃操作，则可以跳跃
    return (is_on_floor() or coyote_jump_timer.time_left > 0) and allow_jump and jump_chance > 0
