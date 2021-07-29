extends Node2D

export (PackedScene) var enemy_scene
signal warningready(x)
signal visible()
var enemy
var x = 0
var score = 0

func _process(_delta):
	if enemy != null && enemy.position.x < $Camera2D.position.x + 300 && enemy.position.x > $Camera2D.position.x - 300:
		emit_signal("visible")
		yield($GUI, "warning_added")

func _on_EnemyTimer_timeout():
	var enemy_spawn_location = $EnemyPath/EnemySpawn
	enemy_spawn_location.unit_offset = randf()
	
	enemy = enemy_scene.instance()
	add_child(enemy)
# warning-ignore:return_value_discarded
	self.get_child(self.get_child_count()-1).connect("i_died", self, "_on_EnemyDied")
	enemy.position = enemy_spawn_location.position
	if enemy.position.x > $Camera2D.position.x+300:
		x = 568
	elif enemy.position.x < $Camera2D.position.x-300:
		x = 32
	else:
		x = 0
	emit_signal("warningready", x)
	yield($GUI, "warning_added")
	if !x == 0:
# warning-ignore:return_value_discarded
		self.get_child(self.get_child_count()-1).connect("i_died", $GUI.get_child($GUI.get_child_count()-1), "fade_out")

func _on_Enemy_ReachedBottom(_body):
	$GUI/HeartBar.change_hearts(-1)

func _on_EnemyDied(_y):
	pass

func _on_LevelTimer_timeout():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/LevelComplete.tscn")

func update_score(y):
	score += int(5000 / y)
	$GUI/ScoreLabel.text = str(score)
