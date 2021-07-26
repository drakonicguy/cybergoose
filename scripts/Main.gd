extends Node2D

export (PackedScene) var enemy_scene
signal warningready(x)
var x = 0

#func _ready():
#	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _on_EnemyTimer_timeout():
	var enemy_spawn_location = $EnemyPath/EnemySpawn
	enemy_spawn_location.unit_offset = randf()
	
	var enemy = enemy_scene.instance()
	add_child(enemy)
	
	enemy.position = enemy_spawn_location.position
	if enemy.position.x > $Camera2D.position.x+300:
		x = 568
	elif enemy.position.x < $Camera2D.position.x-300:
		x = 32
	else:
		x = 0
	emit_signal("warningready", x)


func _on_Enemy_ReachedBottom(_body):
	$GUI/Label.show()
	yield(get_tree().create_timer(0.5), "timeout")
	$GUI/Label.hide()
