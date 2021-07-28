extends Node2D

func _ready():
	var node = get_tree().get_root().find_node("Main", true, false)
	node.connect("visible", self, "disappear")
	if !get_parent().set_x == 0:
		if get_parent().set_x > 300:
			$Sprite.flip_h = false
		else:
			$Sprite.flip_h = true
		self.position.x = get_parent().set_x
		self.show()
		while true:
			yield(get_tree().create_timer(get_process_delta_time()), "timeout")
			self.position.y += 200 * get_process_delta_time()
			if self.position.y >= 603:
					break
	queue_free()

func fade_out():
	var opacity = self.modulate.a
	var i = 10
	while i >= 0:
		self.modulate = Color( 1, 1, 1, opacity)
		opacity-= 0.1
		yield(get_tree().create_timer(get_process_delta_time()), "timeout")
		i -= 1
		
func disappear():
	self.hide()
