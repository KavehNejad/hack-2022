extends Button

signal level_selected

var level_name = "some"

func _ready():
	text = level_name


func _on_Button_pressed():
	emit_signal("level_selected", level_name)
