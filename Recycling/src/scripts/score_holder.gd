extends Control

var current_score = 0

func update_score():
	$score_text.text = "Score: " + String(current_score)

func _on_moving_bin_moving_bin_entered(points):
	current_score += points
	update_score()

func _on_general_waste_bin_general_waste_bin_entered(points):
	current_score += points
	update_score()
