extends Node

const Base_Object = preload("res://src/scenes/base_object.tscn")

var OBJECTS_JSON

var screenSize

func _ready():
	randomize()
	set_decks_json()
	screenSize = int(get_viewport().get_visible_rect().size.x)

func _on_Timer_timeout():
	var object_json = random_object()
	var object = Base_Object.instance()
	object.position.x = random_position()
	object.type = object_json['type']
	object.image_src = object_json['image_src']
	get_parent().add_child(object)


func random_object():
	return OBJECTS_JSON[random_object_index()]

func random_object_index():
	return randi() % OBJECTS_JSON.size()

func random_position():
	return randi() % screenSize

func set_decks_json():
	OBJECTS_JSON = _get_json("res://assets/data/objects/objects.json")

func _get_json(file_path):
	var file = File.new()
	file.open(file_path, file.READ)
	var text = file.get_as_text()
	file.close()
	return parse_json(text)
