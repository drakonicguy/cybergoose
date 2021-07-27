extends Node2D

export (PackedScene) var heart_scene
export (int) var hearts_at_start = 3
export (float) var heart_distance = 60

func _ready():
	self.position.x -= heart_distance
	var current_hearts = hearts_at_start
	while hearts_at_start > 0:
		var heart = heart_scene.instance()
		add_child(heart)
		heart.position.x += heart_distance*hearts_at_start
		hearts_at_start -= 1
