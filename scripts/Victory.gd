extends Node2D

func _ready():
	$VictoryAnim.play("Victory")

func _on_VictoryAnim_animation_finished(_a):
	$VictoryAnim.stop()
