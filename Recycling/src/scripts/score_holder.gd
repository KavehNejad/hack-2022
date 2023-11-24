extends Control

var current_score = 0

func _ready():
	$background.color = "#888888"
	
func update_score():
	if (Global.level_going == true):
		$background/score_text.text = "Score: " + String(current_score)
		change_colour()

func _on_moving_bin_moving_bin_entered(points):
	current_score += points
	update_score()

func _on_general_waste_bin_general_waste_bin_entered(points):
	current_score += points
	update_score()

func change_colour():
	if (current_score == 0):
		$background.color = "#888888"
	elif (current_score > 0):
		$background.color = '#27cf19'
	else:
		$background.color = '#cf194c'
	

func get_current_score():
	return current_score
