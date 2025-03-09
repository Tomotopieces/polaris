## 主角
class_name Hero
extends CharacterBody2D

#region 常量

## 水平移动速度
const SPEED := 160.0

## 跳跃加速度
const JUMP_VELOCITY := -320.0

#endregion

#region 组件

## 图形管理节点
@onready var graphic: Node2D = $Graphic

# 动画机
@onready var animation_player: AnimationPlayer = $AnimationPlayer

## 土狼跳计时器
## 允许主角在离开地面后的一小段时间内进行跳跃
## 从地面状态直接进入下落状态后开始计时
@onready var coyote_jump_timer: Timer = $CoyoteJumpTimer

#endregion

#region 属性

## 角色朝向
## 1为右，-1为左
var _direction := 1:
	set = set_direction

## 状态机
var state_machine: StateMachine

## 指令管理器
var command_manager: CommandManager

## 最大跳跃次数
var max_extra_jump_chance := 1

## 可用跳跃次数
var extra_jump_chance := 0

## 当前是否允许移动（跑动、跳跃）
var allow_move := true

## 水平移动速度倍率
var horizontal_move_ratio := 1.0

## 重力倍率
var gravity_ratio := 1.0
#endregion

func _ready() -> void:
	state_machine = StateMachine.new()
	state_machine.change_state(HeroStateIdle.new(self))
	command_manager = CommandManager.new(self)

func _physics_process(delta: float) -> void:
	velocity += get_gravity() * gravity_ratio * delta # 重力效果
	self._direction = 1 if velocity.x > 0 else -1 if velocity.x < 0 else 0 # 朝向

	var was_on_floor := is_on_floor()
	move_and_slide() # 物理状态
	if not was_on_floor and is_on_floor():
		extra_jump_chance = max_extra_jump_chance # 恢复跳跃次数

	state_machine.update(delta) # 状态机
	command_manager.update(delta) # 指令管理器

## 水平移动
func horizontal_move(direction: float) -> void:
	if not allow_move:
		return

	if direction:
		velocity.x = direction * SPEED * horizontal_move_ratio
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

## 角色朝向 setter
func set_direction(value: int) -> void:
	if _direction == value or value == 0:
		return

	_direction = value
	graphic.scale.x = _direction # 通过变更 graphic 的 scale.x 来改变朝向，避免图片的 offset 导致的错位

## 是否可以跳跃
func can_jump() -> bool:
	# 在地面或在土狼跳时间内，或有剩余的额外跳跃次数，且当前状态允许进行跳跃操作，则可以跳跃
	return (is_on_floor() or coyote_jump_timer.time_left > 0 or extra_jump_chance > 0) and allow_move

## 跳跃
## Returns: 是否从地面起跳
func jump() -> bool:
	# 平地起跳不消耗额外的跳跃次数
	if is_on_floor() or coyote_jump_timer.time_left > 0:
		velocity.y = JUMP_VELOCITY
		return true
	elif extra_jump_chance > 0:
		# 若非平地起跳，则减少额外的跳跃次数
		extra_jump_chance -= 1
		velocity.y = JUMP_VELOCITY
	return false
