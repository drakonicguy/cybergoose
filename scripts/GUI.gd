extends CanvasLayer

export (PackedScene) var enemy_warning_scene

var set_x

func _on_Main_warningready(x):
	set_x = x
	var enemy_warning = enemy_warning_scene.instance()
	add_child(enemy_warning)



func _on_ScrollLeft():
	$ScrollLeft/Sprite.modulate = Color( 1, 1, 1, 0.2)

func _on_ScrollLeftStop():
	$ScrollLeft/Sprite.modulate = Color( 1, 1, 1, 1)

func _on_ScrollRight():
	$ScrollRight/Sprite.modulate = Color( 1, 1, 1, 0.2)

func _on_ScrollRightStop():
	$ScrollRight/Sprite.modulate = Color( 1, 1, 1, 1)
