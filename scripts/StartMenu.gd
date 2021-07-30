extends Node2D

func _ready():
	$MenuAnim.play("MenuAnim")

func _on_TextureButton_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/BeginningCutscene.tscn")

func _on_TextureButton3_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/Main.tscn")

func _on_TextureButton2_pressed():
	get_tree().quit()

func _on_MenuAnim_animation_finished(_anim_name):
	$MenuAnim.clear_queue()
