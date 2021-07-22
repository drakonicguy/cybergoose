extends Node2D

export (PackedScene) var laser_scene
# warning-ignore:unused_argument
#global_rotation_degrees << if we need to retrieve rotation degrees use this
func _process(delta):
	look_at(get_global_mouse_position())
	if get_global_mouse_position().x < position.x:
		$Sprite.flip_v = true
	else:
		$Sprite.flip_v = false

# warning-ignore:unused_argument
func _input(event):
	if Input.is_action_just_pressed("shoot"):
		print("pew pew")
		var laser = laser_scene.instance()
		add_child(laser)
		laser.look_at(get_global_mouse_position())
