extends Node2D

@onready var geometry: TileMapLayer = $Geometry
@onready var camera: Camera2D = $Hero/Camera

func _ready() -> void:
	var used = geometry.get_used_rect().grow(-1)
	var size = geometry.tile_set.tile_size
	
	camera.limit_top = used.position.y * size.y
	camera.limit_left = used.position.x * size.x
	camera.limit_bottom = used.end.y * size.y
	camera.limit_right = used.end.x * size.x
	
	camera.reset_smoothing()
