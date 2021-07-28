extends KinematicBody2D

const SPEED = 2000

func _process(delta):
	position += transform.x * SPEED * delta

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
