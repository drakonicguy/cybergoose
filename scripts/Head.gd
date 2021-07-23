extends Node2D

const MAX_SPEED = 800
const ACCEL = 2000
const DECEL = 500
var velocity = 0
var dir = 0
var speed = 0

export (PackedScene) var laser_scene

#global_rotation_degrees << if we need to retrieve rotation degrees use this

func _process(delta):
	
	look_at(get_global_mouse_position())
	if get_global_mouse_position().x < position.x:
		$Sprite.flip_v = true
	else:
		$Sprite.flip_v = false
	
	_move(delta)

	pass

func _input(_event):
	if Input.is_action_just_pressed("shoot"):
		var laser = laser_scene.instance()
		owner.add_child(laser)
		laser.transform = global_transform

func _move(delta):
	dir = 0
	if Input.is_action_pressed("move_left"):
		dir = -1
	if Input.is_action_pressed("move_right"):
		dir = 1
	
	if dir:
		speed += ACCEL * delta
	else:
		speed -= DECEL * delta
	speed = clamp(speed, 0, MAX_SPEED)
	
	velocity = speed * delta * dir
	self.translate(Vector2(velocity, 0)) # changing node's position
