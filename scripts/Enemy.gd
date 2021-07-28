extends RigidBody2D

export var EnemySpeed = 100
export var EnemyHealth = 2
var dead = false
signal i_died

func _process(delta):
	self.position.y+=EnemySpeed*delta
	if self.position.y >= 600:
		queue_free()

func _on_Laser_Touched(_body):
	if dead == false and EnemyHealth == 1:
		dead = true
		emit_signal("i_died")
		self.collision_layer = 1
		var animationtimer = 0
		var opacity = 1
		while animationtimer < 11:
			self.modulate = Color( 255, 0, 175, opacity)
			opacity-= 0.2
			animationtimer+=1
			yield(get_tree().create_timer(get_process_delta_time()), "timeout")
	else:
		if dead == false:
			self.modulate = Color( 255, 0, 175, 1)
			yield(get_tree().create_timer(get_process_delta_time()), "timeout")
			self.modulate = Color( 1, 1, 1, 1)
			EnemyHealth -= 1
