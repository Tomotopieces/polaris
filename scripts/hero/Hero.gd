## 玩家角色
class_name Hero extends CharacterBody2D

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
var _direction := 1:
    set = set_direction

# 状态机
var state_machine: StateManchine

# 最大跳跃次数
var max_jump_chance := 2

# 可用跳跃次数
var jump_chance := 0

# 当前是否允许移动（跑动、跳跃）
var allow_move := true

# 重力倍率
var gravity_ratio: float = 1
#endregion

func _ready() -> void:
    state_machine = StateManchine.new()
    state_machine.change_state(HeroStateIdle.new(self))

func _physics_process(delta: float) -> void:
    velocity += get_gravity() * gravity_ratio * delta # 重力效果
    self._direction = 1 if velocity.x > 0 else -1 if velocity.x < 0 else 0 # 朝向

    var not_on_floor = not is_on_floor()
    move_and_slide() # 物理状态
    if not_on_floor and is_on_floor():
        jump_chance = max_jump_chance # 恢复跳跃次数

    state_machine.update(delta) # 状态机

# 水平移动
func horizontal_move() -> void:
    if not allow_move:
        return

    if _direction:
        velocity.x = _direction * SPEED
    else:
        velocity.x = move_toward(velocity.x, 0, SPEED)

# 角色朝向 setter
func set_direction(value: int) -> void:
    if _direction == value or value == 0:
        return

    _direction = value
    graphic.scale.x = _direction # 通过变更 graphic 的 scale.x 来改变朝向，避免图片的 offset 导致的错位

# 是否可以跳跃
func can_jump() -> bool:
    # 在地面或在土狼跳时间内，有剩余的跳跃次数，且当前状态允许进行跳跃操作，则可以跳跃
    return (is_on_floor() or coyote_jump_timer.time_left > 0) and allow_move and jump_chance > 0
