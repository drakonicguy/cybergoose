extends CanvasLayer

func _input(_event):
	if Input.is_action_just_pressed("shoot"):
		get_tree().change_scene("res://scenes/StartMenu.tscn")
