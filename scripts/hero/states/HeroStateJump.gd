## 玩家状态 跳跃
class_name HeroStateJump
extends State

static var NAME := "Jump"

# 玩家角色
var hero: Hero

func _init(hero: Hero) -> void:
    super(NAME)
    self.hero = hero

func enter(exit_state: State) -> void:
    hero.jump_chance -= 1
    hero.velocity.y = hero.JUMP_VELOCITY
    hero.animation_player.play("jumping")

func update(delta: float) -> void:
    super(delta)

    if is_zero_approx(hero.velocity.y): # 进入下落状态
        hero.state_machine.change_state(HeroStateFall.new(hero))
