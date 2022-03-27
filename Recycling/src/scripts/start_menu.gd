extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _process(delta):
	if not $VideoPlayer.is_playing():
		$VideoPlayer.play()

func _on_start_button_pressed():
	print("hi")
	var followingScene = get_tree().change_scene("res://src/scenes/level_select.tscn")
	#Global.go_to_scene("res://src/scenes/level_select.tscn")
