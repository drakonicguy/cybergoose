extends Node2D

var num = 1

func _ready():
	num = 1

func _input(_event):
	if Input.is_action_just_pressed("shoot"):
		num += 1
		if num < 4:
			match num:
				2:
					$TutorialLabel.visible = false
					$TutorialLabel2.visible = true
				3:
					$TutorialLabel2.visible = false
					$TutorialLabel3.visible = true
		else:
# warning-ignore:return_value_discarded
			get_tree().change_scene("res://Scenes/Main.tscn")
