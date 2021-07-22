extends Node2D

# warning-ignore:unused_argument
#global_rotation_degrees << if we need to retrieve rotation degrees use this
func _process(delta):
	look_at(get_global_mouse_position())
	if get_global_mouse_position().x < position.x:
		$Sprite.flip_v = true
	else:
		$Sprite.flip_v = false
