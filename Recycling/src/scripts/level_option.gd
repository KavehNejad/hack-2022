extends TextureButton

signal level_selected

var level_name = "some"

func _ready():
	show_image()


func _on_Button_pressed():
	emit_signal("level_selected", level_name)

func show_image():
	if (level_name == "Level 1"):
		set_normal_texture(load("res://assets/images/level_preview/1.png"))
	elif (level_name == "Level 2"):
		set_normal_texture(load("res://assets/images/level_preview/2.png"))
	elif (level_name == "Level 3"):
		set_normal_texture(load("res://assets/images/level_preview/3.png"))
	elif (level_name == "Level 4"):
		set_normal_texture(load("res://assets/images/level_preview/4.png"))
