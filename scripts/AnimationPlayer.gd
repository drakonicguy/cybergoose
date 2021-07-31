extends AnimationPlayer


func _ready():
	Globals.currentstage = 1
	Globals.currentscore = 0
	play("BeginningCutscene")

func _on_AnimationPlayer_animation_finished(_anim_name):
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/Main.tscn")

func _input(_event):
	if Input.is_action_just_pressed("shoot"):
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://Scenes/Main.tscn")
