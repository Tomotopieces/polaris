## 玩家状态 跑动
class_name HeroStateRun
extends State

static var NAME := "Run"

# 玩家角色
var hero: Hero

func _init(hero: Hero) -> void:
    super(NAME)
    self.hero = hero

func enter(exit_state: State) -> void:
    hero.animation_player.play("running")

func update(delta: float) -> void:
    super(delta)

    if is_zero_approx(hero.velocity.x): # 进入闲置状态
        hero.state_machine.change_state(HeroStateIdle.new(hero))
    
    if not is_zero_approx(hero.velocity.y): # 进入下落状态
        hero.state_machine.change_state(HeroStateFall.new(hero))
