extends RigidBody2D

export var EnemySpeed = 100
export var EnemyHealth = 2
var dead = false
#signal i_spawned
signal i_died(y)

func _ready():
# warning-ignore:return_value_discarded
	self.connect("i_died", get_tree().get_root().find_node("Main", true, false), "update_score")

func _process(delta):
	self.position.y += EnemySpeed * delta
	if self.position.y >= 600:
		queue_free()

func _on_Laser_Touched(_body):
	if dead == false and EnemyHealth == 1:
		dead = true
		emit_signal("i_died", position.y)
		self.collision_layer = 1
		
		$Explosion.show()
		$Explosion.play()
		
		var animationtimer = 0
		var opacity = 1
		while animationtimer < 11:
			$Enemy.modulate = Color(255, 0, 175, opacity)
			opacity -= 0.2
			animationtimer += 1
			yield(get_tree().create_timer(get_process_delta_time()), "timeout")
	else:
		if dead == false:
			self.modulate = Color(255, 0, 175, 1)
			yield(get_tree().create_timer(get_process_delta_time()), "timeout")
			self.modulate = Color(1, 1, 1, 1)
			EnemyHealth -= 1

func _on_Explosion_animation_finished():
	$Explosion.hide()
