extends CanvasLayer

func _ready():
	$AnimationPlayer.play("BeginningCutscene")
	yield(get_tree().create_timer(3.1), "timeout")
	$AnimationPlayer.stop()
	$Pic1.hide()
	$Pic2.hide()
	$Text.show()
	yield(get_tree().create_timer(2), "timeout")
	$Text.hide()
	$Pic2.show()
	$AnimationPlayer.play("BeginningCutscene")
	$AnimationPlayer.advance(3.1)
	yield($AnimationPlayer, "animation_finished")
	$Text.text = "The Glonks are ruthless space criminals, responsible for the destruction of multiple planets..."
	$Text.show()
	yield(get_tree().create_timer(5), "timeout")
	$Text.text = "Earth is surely doomed... Unless..." 
	yield(get_tree().create_timer(3), "timeout")
	$Text.text = "A certain robo-bird stops their evil plan..."
	yield(get_tree().create_timer(5), "timeout")
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/Main.tscn")
	
func _input(_event):
	if Input.is_action_just_pressed("shoot"):
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://Scenes/Main.tscn")
