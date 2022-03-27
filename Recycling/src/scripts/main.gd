extends Node

func _ready():
	LoadScenes.get_node("AnimationPlayer").play("fade_in")

func _on_Button_pressed():
		var _unused = get_tree().change_scene("res://src/scenes/level_select.tscn")
