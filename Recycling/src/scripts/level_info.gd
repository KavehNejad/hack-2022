extends Node2D

export(PackedScene) var object_info_scene

var objects_json
var bin_types
var level_name

func _ready():
	level_name = Global.level_name
	set_objects_json()
	set_bin_types()
	set_obect_infos()


func set_obect_infos():
	for object_json in objects_json:
		set_object_info(object_json)


func set_object_info(object):
	var bin = objects_bin(object)
	var object_info = object_info_scene.instance()
	
	object_info.set_up_object(object, bin)
	$ScrollContainer/VBoxContainer.add_child(object_info)


func objects_bin(object):
	for bin in bin_types:
		if bin['name'] == object.type:
			return bin


func set_objects_json():
	objects_json = _get_json("res://assets/data/objects/objects.json")[level_name]


func set_bin_types():
	bin_types = _get_json("res://assets/data/bins.json")[level_name]


func _get_json(file_path):
	var file = File.new()
	file.open(file_path, file.READ)
	var text = file.get_as_text()
	file.close()
	return parse_json(text)
