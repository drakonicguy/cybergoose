extends AnimationPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	play("BeginningCutscene")


func _on_AnimationPlayer_animation_finished(anim_name):
	get_tree().change_scene("res://Scenes/Main.tscn")
