extends Node

var level_end_screen = preload("res://src/scenes/level_end_info.tscn")

func _ready():
	LoadScenes.get_node("AnimationPlayer").play("fade_in")

func _on_Button_pressed():
		var _unused = get_tree().change_scene("res://src/scenes/level_select.tscn")


func _on_level_timer_timeout():
	add_level_end_screen() # Replace with function body.
	
func add_level_end_screen():
	var level_end_screen_instance = level_end_screen.instance()
	add_child(level_end_screen_instance)
