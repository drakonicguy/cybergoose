extends ColorRect

#var paused = false
#
#func _ready():
#	pass 
#
#func _input(event):
#	if Input.is_action_just_pressed("pause") && get_tree().paused == false:
#		if paused:
#			get_tree().paused = false
#			self.visible = false
#		else:
#			get_tree().paused = true
#			self.visible = true
#		paused = !paused
