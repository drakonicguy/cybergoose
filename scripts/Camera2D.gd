extends Camera2D

var scroll = "none"
export var scrollspeed = 5

func _process(delta):
	if scroll == "left":
		self.position.x-=scrollspeed
	elif scroll == "right":
		self.position.x+=scrollspeed
	self.position.x = clamp(self.position.x, $"../LBorder".position.x, $"../RBorder".position.x)

func _on_ScrollLeft():
	scroll = "left"

func _on_ScrollLeftStop():
	scroll = "none"

func _on_ScrollRight():
	scroll = "right"

func _on_ScrollRightStop():
	scroll = "none"
