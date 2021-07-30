extends CanvasLayer

func _ready():
	$RUMBLE.play()
	$AnimationPlayer.play("gameover")
	yield($AnimationPlayer, "animation_finished")
	$RUMBLE.stop()
	$glonkd.play()
	$cybergoosecutscenelose2.show()
	$Text.show()
	yield($Control, "clicked")
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/StartMenu.tscn")
