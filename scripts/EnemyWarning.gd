extends Node2D

func _ready():
	if !get_parent().set_x == 0:
		if get_parent().set_x > 300:
			$Sprite.flip_h = false
		else:
			$Sprite.flip_h = true
		self.position.x = get_parent().set_x
		self.show()
		var opacity = 1
		while true:
			yield(get_tree().create_timer(get_process_delta_time()), "timeout")
			self.position.y+=150*get_process_delta_time()
			if self.position.y >= 250:
				self.modulate = Color( 1, 1, 1, opacity)
				opacity-= 0.1
			if self.position.y >= 603:
					break
		queue_free()
