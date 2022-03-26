extends Node

const Base_Object = preload("res://src/scenes/base_object.tscn")

var screenSize

func _ready():
	randomize()
	screenSize = int(get_viewport().get_visible_rect().size.x)

func _on_Timer_timeout():
	var object = random_object().instance()
	object.position.x = random_position()
	get_parent().add_child(object)


func random_object():
	return Base_Object

func random_position():
	return randi() % screenSize

