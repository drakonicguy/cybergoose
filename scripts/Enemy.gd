extends RigidBody2D

export var EnemySpeed = 100

func _process(delta):
	self.position.y+=EnemySpeed*delta
	if self.position.y >= 600:
		queue_free()



func _on_Laser_Touched(_body):
	self.collision_layer = 1
	var animationtimer = 0
	var opacity = 1
	while animationtimer < 11:
		self.modulate = Color( 1, 1, 1, opacity)
		opacity-= 0.1
		animationtimer+=1
		yield(get_tree().create_timer(get_process_delta_time()), "timeout")
	queue_free()
