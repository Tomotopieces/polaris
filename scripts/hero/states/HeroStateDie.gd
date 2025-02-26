# 玩家状态 死亡
class_name HeroStateDie extends State

static var NAME := "Die"

# 玩家角色
var hero: Hero

func _init(hero: Hero) -> void:
    super(NAME)
    self.hero = hero

func enter(exit_state: State) -> void:
    hero.animation_player.play("dying")

func update(delta: float) -> void:
    super(delta)
    if not hero.animation_player.is_playing():
        pass # TODO 死亡结算
