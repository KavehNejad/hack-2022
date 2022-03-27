extends Node

func _ready():
	$AnimationPlayer.play("fade_in")
	print("hello")

func go_to_scene(path):
	$AnimationPlayer.play("fade_out")
	yield($AnimationPlayer, "animation_finished")
	var followingScene = get_tree().change_scene(path)
