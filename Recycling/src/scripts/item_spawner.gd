extends Node

const Base_Object = preload("res://src/scenes/base_object.tscn")

func _on_Timer_timeout():
	var object = random_object().instance()
	get_parent().add_child(object)



func random_object():
	return Base_Object

func random_position():
	pass
