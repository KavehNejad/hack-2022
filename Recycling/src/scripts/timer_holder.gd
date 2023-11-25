extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$level_timer.set_wait_time(60)

func _process(delta):
	$background/score_text.text = str(int($level_timer.time_left))


func _on_start_button_pressed():
	$level_timer.start()
