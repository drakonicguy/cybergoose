extends Node2D

export (PackedScene) var enemy_scene

func _on_EnemyTimer_timeout():
	var enemy_spawn_location = $EnemyPath/EnemySpawn
	enemy_spawn_location.unit_offset = randf()
	
	var enemy = enemy_scene.instance()
	add_child(enemy)
	enemy.position = enemy_spawn_location.position
	var x = 0
	$GUI/EnemyWarning.flip_h = false
	if enemy.position.x > $Head.position.x:
		x = 530
		$GUI/EnemyWarning.flip_h = true
	$GUI/EnemyWarning.set_position(Vector2(x, enemy.position.y))
	$GUI/EnemyWarning.show()

func _on_Enemy_ReachedBottom(_body):
	$GUI/Label.show()
	yield(get_tree().create_timer(0.5), "timeout")
	$GUI/Label.hide()

