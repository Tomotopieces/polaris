## 通用状态 初始
class_name CommonStateInit
extends ActionizedState

static var NAME := "Init"

func _init() -> void:
	super(NAME, StatePriority.Enum.INIT, true)
