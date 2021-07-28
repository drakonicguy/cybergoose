extends ColorRect

var paused = false

func _ready():
	pass 

func _input(_delta):
	if Input.is_action_just_pressed("pause"):
		if paused:
			get_tree().paused = false
			self.visible = false
		else:
			get_tree().paused = true
			self.visible = true
		paused = !paused
