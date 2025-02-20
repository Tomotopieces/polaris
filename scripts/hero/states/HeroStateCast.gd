# 玩家状态 使用技能
class_name HeroStateCast extends State

static var NAME := "Cast"

# 玩家角色
var hero: Hero

# 技能
var skill: Skill

func _init(hero: Hero, skill: Skill) -> void:
    super(NAME)
    self.hero = hero
    self.skill = skill

func enter(exit_state: State) -> void:
    skill.start()

func update(delta: float) -> void:
    super(delta)
