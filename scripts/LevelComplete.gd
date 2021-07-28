extends Node2D

func _on_TextureButton_pressed():	
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/Main.tscn")


func _on_TextureButton2_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/StartMenu.tscn")
