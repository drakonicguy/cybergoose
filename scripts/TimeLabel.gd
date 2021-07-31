extends Label

var timestring = "00"

func _ready():
	pass

func _process(_delta):
	set_text(str(int($LevelTimer.time_left)))
