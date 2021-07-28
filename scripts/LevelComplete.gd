extends Node2D

func _on_TextureButton_pressed():
	get_tree().change_scene("res://Scenes/Main.tscn")


func _on_TextureButton2_pressed():
	get_tree().change_scene("res://Scenes/StartMenu.tscn")
