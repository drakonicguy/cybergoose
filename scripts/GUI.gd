extends CanvasLayer

export (PackedScene) var enemy_warning_scene

var set_x

func _on_Main_warningready(x):
	set_x = x
	var enemy_warning = enemy_warning_scene.instance()
	add_child(enemy_warning)
