## 玩家状态 下落
class_name HeroStateFall
extends State

static var NAME := "Fall"

var hero: Hero

func _init(hero: Hero) -> void:
    super(NAME)
    self.hero = hero

func enter(exit_state: State) -> void:
    hero.animation_player.play("falling")

func update(delta: float) -> void:
    super(delta)

    if hero.is_on_floor():
        # 着陆时根据水平速度判断进入闲置还是跑动
        if is_zero_approx(hero.velocity.x):
            hero.state_machine.change_state(HeroStateIdle.new(hero))
        else:
            hero.state_machine.change_state(HeroStateRun.new(hero))
