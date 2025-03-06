## 指令优先级枚举
class_name CommandPriority

enum Enum {
	## 跳跃指令
	JUMP = 2,

	## 低优先级技能指令
	LOW_PRIORITY_SKILL = 10,

	## 中优先级施法指令
	MIDDLE_PRIORITY_SKILL = 20,

	## 高优先级施法指令
	HIGHT_PRIORITY_SKILL = 30,

	## 闪避指令
	DODGE = 40,
}
