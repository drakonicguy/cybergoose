extends Node2D

func _ready():
	get_tree().paused = false
	$VictoryAnim.play("Victory")
	yield($VictoryAnim, "animation_finished")
	yield(get_tree().create_timer(2), "timeout")
	$TextureRect.hide()
	$Text.show()
	yield(get_tree().create_timer(3), "timeout")
	$Text.text = "Woo! You win! Your score: " + str(Globals.currentscore)
	yield($Control, "clicked")
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/StartMenu.tscn")
