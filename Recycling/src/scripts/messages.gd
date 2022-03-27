extends Control
	

func _ready():
	visible = false

func _on_moving_bin_wrong_bin(message):
	$background/error_message.text = message
	show_node()

func show_node():
	print("error message")
	visible = true
	$dissapear_timer.start()


func _on_dissapear_timer_timeout():
	$fade_out_animation.play("fade_out_message")
	yield($fade_out_animation, "animation_finished" )
	visible = false
