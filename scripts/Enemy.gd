extends RigidBody2D

#signal ReachedBottom
export var EnemySpeed = 1
var dead = false

func _process(_delta):
	self.position.y+=EnemySpeed
	if self.position.y >= 600 and dead == false:
#		emit_signal("ReachedBottom")
		queue_free()



func _on_Laser_Touched(_body):
	dead = true
	var animationtimer = 0
	var opacity = 1
	while animationtimer < 11:
		self.modulate = Color( 1, 1, 1, opacity)
		opacity-= 0.1
		animationtimer+=1
		yield(get_tree().create_timer(get_process_delta_time()), "timeout")
	queue_free()
