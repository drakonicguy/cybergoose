extends Node2D

func _on_TextureButton_pressed():
	get_tree().change_scene("res://Scenes/BeginningCutscene.tscn")


func _on_TextureButton2_pressed():
	get_tree().quit()
