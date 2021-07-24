extends Node2D

export (PackedScene) var enemy_scene

func _on_EnemyTimer_timeout():
	var enemy_spawn_location = $EnemyPath/EnemySpawn
	enemy_spawn_location.unit_offset = randf()
	
	var enemy = enemy_scene.instance()
	add_child(enemy)
	
	enemy.position = enemy_spawn_location.position


func _on_Enemy_ReachedBottom(body):
	$CanvasLayer/Label.show()
	yield(get_tree().create_timer(0.5), "timeout")
	$CanvasLayer/Label.hide()
