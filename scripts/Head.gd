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
		$Sprite.offset.x = -26
		yield(self, "unflip")
		$Sprite.rotation_degrees -=180
		$Sprite.offset.x = 26

func _process(_delta):
	pass
	var distance2mouse = self.global_position.distance_to(get_global_mouse_position())
	look_at(get_global_mouse_position())
	if get_global_mouse_position().x < position.x:
		emit_signal("flip")
		$Sprite.flip_h = true
	else:
		emit_signal("unflip")
		$Sprite.flip_h = false
	if distance2mouse <= 200:
		$Sprite.animation = "close"
	else:
		$Sprite.animation = "default"
	
func _input(_event):
	if Input.is_action_just_pressed("shoot"):
		var laser = laser_scene.instance()
		owner.add_child(laser)
		if get_global_mouse_position().x < position.x:
			laser.transform = $ShootPositionFlipped.global_transform
		else:
			laser.transform = $ShootPosition.global_transform
		var soundclip = randi() % 2
		match soundclip:
			0:
				$Pew.play()
			1:
				$Pew2.play()
