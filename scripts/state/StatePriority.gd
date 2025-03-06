## 状态优先级枚举
class_name StatePriority

enum Enum {
	## 初始化状态
	INIT = 0,

	## 地面状态（闲置、跑动）
	GROUND = 1,

	## 空中状态（跳跃、下落）
	AIR = 2,
		
	## 低优先级施法状态
	LOW_PRIORITY_CAST = 10,

	## 中优先级施法状态
	MIDDLE_PRIORITY_CAST = 20,
	
	## 高优先级施法状态
	HIGHT_PRIORITY_CAST = 30,
	
	## 闪避状态
	DODGE = 40,
	
	## 受伤状态
	HURT = 50,
	
	## 死亡状态
	DIE = 100,
}
