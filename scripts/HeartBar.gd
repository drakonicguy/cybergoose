extends Node2D

export (PackedScene) var heart_scene
export (int) var hearts_at_start = 3
export (float) var heart_distance = 60

func _ready():
	hearts_at_start = Globals.hp
	self.position.x -= heart_distance
	while hearts_at_start > 0:
		var heart = heart_scene.instance()
		add_child(heart)
		heart.position.x += heart_distance * hearts_at_start
		hearts_at_start -= 1

func change_hearts(amount):
	get_tree().call_group("hearts", "queue_free")
	Globals.hp += amount
	if Globals.hp > 0:
		var i = Globals.hp
		while i > 0:
			var heart = heart_scene.instance()
			add_child(heart)
			heart.position.x += heart_distance * i
			i -= 1
	else:
		Globals.hp = 3
# warning-ignore:return_value_discarded
		if Globals.currentstage == 4:
			get_tree().change_scene("res://Scenes/GameOver.tscn")
		else:
			Globals.currentscore = Globals.prevstagescore
			get_tree().change_scene("res://Scenes/GameOverCutscene.tscn")
