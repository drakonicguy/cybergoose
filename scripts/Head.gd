extends Node2D

const MAX_SPEED = 800
const ACCEL = 2000
const DECEL = 500
var velocity = 0
var dir = 0
var speed = 0

export (PackedScene) var laser_scene

signal flip
signal unflip

func _ready():
	while true:
		yield(self, "flip")
		$Sprite.rotation_degrees +=180
		yield(self, "unflip")
		$Sprite.rotation_degrees -=180
	

func _process(_delta):
	pass
	var distance2mouse = self.global_position.distance_to(get_global_mouse_position())
	look_at(get_global_mouse_position())
	if get_global_mouse_position().x < position.x:
		emit_signal("flip")
		if distance2mouse <= 150:
			$Sprite.animation = "closeL"
		else:
			$Sprite.animation = "defaultL"
	else:
		emit_signal("unflip")
		if distance2mouse <= 150:
			$Sprite.animation = "close"
		else:
			$Sprite.animation = "default"
	
func _input(_event):
	if Input.is_action_just_pressed("shoot"):
		var laser = laser_scene.instance()
		add_child(laser)
		if get_global_mouse_position().x < position.x:
			laser.position = $ShootPositionFlipped.position
		else:
			laser.position = $ShootPosition.position

#func _move(delta):
#	dir = 0
#	if Input.is_action_pressed("move_left"):
#		dir = -1
#	if Input.is_action_pressed("move_right"):
#		dir = 1
#
#	if dir:
#		speed += ACCEL * delta
#	else:
#		speed -= DECEL * delta
#	speed = clamp(speed, 0, MAX_SPEED)
#
#	velocity = speed * delta * dir
#	self.translate(Vector2(velocity, 0)) # changing node's position
