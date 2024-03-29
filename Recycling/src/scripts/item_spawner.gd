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

var level = "Level 1"


func _ready():
	randomize()
	level = Global.level_name
	set_objects_json()
	screenSize = int(get_viewport().get_visible_rect().size.x)


func _on_spawn_timeout():
	if (Global.level_going == true):
		var object_json = random_object()
		var object = Base_Object.instance()
		object.position.x = random_position()
		object.type = object_json['type']
		object.points = object_json['points']
		object.image_src = object_json['image_src']
		object.object_name = object_json['name']
		object.speed = object_speed
		add_child(object)


func random_object():
	return OBJECTS_JSON[random_object_index()]


func random_object_index():
	return randi() % OBJECTS_JSON.size()


func random_position():
	return (randi() % (screenSize - 70)) + 35


func set_objects_json():
	OBJECTS_JSON = _get_json("res://assets/data/objects/objects.json")[level]


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


func _on_start_button_pressed():
	Global.level_going = true
	$spawn.start()
	$speed_increase.start()
	$spawn_timer_increase.start()
	


func _on_level_timer_timeout():
	Global.level_going = false
