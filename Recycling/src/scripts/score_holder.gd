extends Control

var current_score

func _process(delta):
	update_score()
	

func update_score():
	$score_text.text = current_score


func _on_moving_bin_moving_bin_entered(score):
	current_score += score


func _on_general_waste_bin_general_waste_bin_entered(score):
	current_score += score
