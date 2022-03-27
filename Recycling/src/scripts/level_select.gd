extends Node2D

export(PackedScene) var level_button

var LEVELS_JSON

func _ready():
	set_levels_json()
	create_buttons()

func _process(delta):
	if not $VideoPlayer.is_playing():
		$VideoPlayer.play()

func create_buttons():
	for level in LEVELS_JSON:
		var new_button = level_button.instance()
		new_button.level_name = level.name
		$ScrollContainer/HBoxContainer.add_child(new_button)
		new_button.connect('level_selected', self, '_on_level_select')


func set_levels_json():
	LEVELS_JSON = _get_json("res://assets/data/levels.json")




func _get_json(file_path):
	var file = File.new()
	file.open(file_path, file.READ)
	var text = file.get_as_text()
	file.close()
	return parse_json(text)


func _on_level_select(level_name):
	Global.level_name = level_name
	var _unused = get_tree().change_scene("res://src/scenes/main.tscn")
