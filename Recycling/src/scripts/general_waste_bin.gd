extends Area2D

signal general_waste_bin_entered(score)


func _on_general_waste_bin_body_entered(body):
	if body.is_in_group('falling_object'):
		var score = 0
		emit_signal("moving_bin_entered", score)
