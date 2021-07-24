extends RigidBody2D

signal ReachedBottom
export var EnemySpeed = 1

func _process(delta):
	self.position.y+=EnemySpeed
	if self.position.y >= 600:
		emit_signal("ReachedBottom")
		queue_free()
