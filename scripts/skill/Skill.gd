# 技能
class_name Skill

var hero: Hero

# 动画帧事件触发回调函数列表
# 类型皆需为 () -> void
var trigger_callbacks: Array[Callable]

func _init(hero: Hero) -> void:
    self.hero = hero
    self.trigger_callbacks = []

# 开始技能流程
func start() -> void:
    pass

# 结束技能流程
func end() -> void:
    pass
