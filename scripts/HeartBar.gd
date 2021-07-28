extends Node2D

export (PackedScene) var heart_scene
export (int) var hearts_at_start = 3
export (float) var heart_distance = 60
var current_hearts = hearts_at_start

func _ready():
	self.position.x -= heart_distance
	while hearts_at_start > 0:
		var heart = heart_scene.instance()
		add_child(heart)
		heart.position.x += heart_distance*hearts_at_start
		hearts_at_start -= 1

func change_hearts(amount):
	get_tree().call_group("hearts", "queue_free")
	current_hearts += amount
	if current_hearts > 0:
		var i = current_hearts
		while i > 0:
			var heart = heart_scene.instance()
			add_child(heart)
			heart.position.x += heart_distance*i
			i -= 1
	else:
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://Scenes/GameOver.tscn")
