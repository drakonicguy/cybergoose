extends KinematicBody2D

const SPEED = 2000;

func _process(delta):
	position += transform.x * SPEED * delta
