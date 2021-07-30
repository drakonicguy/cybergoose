extends Control

signal clicked

func _input(event):
	if Input.is_action_just_pressed("shoot"):
		emit_signal("clicked")
