extends Control
	

func _ready():
	visible = false

func _on_moving_bin_wrong_bin(message):
	display_message(message)

func show_node():
	visible = true
	$dissapear_timer.start()


func _on_dissapear_timer_timeout():
	$fade_out_animation.play("fade_out_message")
	yield($fade_out_animation, "animation_finished" )
	visible = false
	modulate = '#ffffff'


func display_message(message):
	if (Global.level_going == true):
		$background/error_message.text = message
		show_node()


func _on_general_waste_bin_wrong_bin(message):
	display_message(message)
