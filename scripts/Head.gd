extends Node2D

const MAX_SPEED = 800
const ACCEL = 2000
const DECEL = 500
var velocity = 0
var dir = 0
var speed = 0

export (PackedScene) var laser_scene

func _ready():
	pass
#	below is a workaround for the center pivot point.
#	$Sprite.position.y = 75
#	$Sprite.animation = "default"
	

func _process(_delta):
	pass
#	below is a workaround for the center pivot point.
#	var distance2mouse = self.global_position.distance_to(get_global_mouse_position())
#	look_at(get_global_mouse_position())
#	if get_global_mouse_position().x < position.x:
#		$Sprite.flip_v = true
#		$Sprite.position.x = -57
#		self.global_rotation_degrees = min(self.global_rotation_degrees, 30)
#		if self.global_rotation_degrees == 30:
#			$Sprite.flip_v = false
#			$Sprite.flip_h = true
#			self.global_rotation_degrees = -30
#		else:
#			$Sprite.flip_h = false
#	else:
#		$Sprite.flip_v = false
#		$Sprite.flip_h = false
#		$Sprite.position.x = -57
#		self.global_rotation_degrees = min(self.global_rotation_degrees, 30)
#	if distance2mouse <= 150:
#		$Sprite.animation = "close"
#	else:
#		$Sprite.animation = "default"
	
func _input(_event):
	if Input.is_action_just_pressed("shoot"):
		var laser = laser_scene.instance()
		add_child(laser)
		if $Sprite.flip_v == true:
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
