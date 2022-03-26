extends Node

const Base_Object = preload("res://src/scenes/base_object.tscn")
const SPEED_INCREASE = 0.5
const MAX_SPEED = 7
const MIN_SPAWN_TIME = 1
const SPAWN_TIME_INCREASE = 0.1

onready var spawn_timer = get_node("spawn")

var OBJECTS_JSON

var screenSize
var object_speed = 1.5


func _ready():
	randomize()
	set_decks_json()
	screenSize = int(get_viewport().get_visible_rect().size.x)

func _on_spawn_timeout():
	var object_json = random_object()
	var object = Base_Object.instance()
	object.position.x = random_position()
	object.type = object_json['type']
	object.points = object_json['points']
	object.image_src = object_json['image_src']
	object.speed = object_speed
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


func _on_speed_increase_timeout():
	object_speed += SPEED_INCREASE
	object_speed = clamp(object_speed, 1, MAX_SPEED)


func _on_spawn_timer_increase_timeout():
	var spawn_time = spawn_timer.get_wait_time()
	spawn_time -= SPAWN_TIME_INCREASE
	if spawn_time < MIN_SPAWN_TIME:
		return

	spawn_timer.set_wait_time(spawn_time)
