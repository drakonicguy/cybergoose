extends Label

var lapsed = 0
var start = false

func _ready():
	lapsed = 0

func _process(delta):
	if self.visible == true:
		if self.visible_characters < self.text.length():
			lapsed += delta
			visible_characters = lapsed / 0.09
		
func _input(_event):
	if Input.is_action_just_pressed("shoot") && self.visible == true:
		if self.visible_characters < self.text.length():
			self.visible_characters = self.text.length()
