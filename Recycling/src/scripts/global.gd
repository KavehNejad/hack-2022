extends Node

var level_name = "Level 4"

#func _ready():
	#$fade_out_screen.play_backwards("fade_out_screen")

func go_to_scene(path):
	#$fade_out_screen.play("fade_out_screen")
	#yield($fade_out_screen, "animation_finished" )
	var followingScene = get_tree().change_scene(path)
