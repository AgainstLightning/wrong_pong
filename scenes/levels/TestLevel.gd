extends Polygon2D

func _ready():
	var viewport_rect = get_viewport().get_visible_rect()
	material.set_shader_parameter("viewport_size", viewport_rect.size)
	material.set_shader_parameter("grid_size", 20.0)
	material.set_shader_parameter("max_length", 18.0)

func _process(delta):
	var local_mouse_pos = get_local_mouse_position()
	material.set_shader_parameter("mouse_pos", local_mouse_pos)
