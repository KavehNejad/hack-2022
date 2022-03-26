extends Control

var score

func _process(delta):
	update_score()
	

func _on_bin_update_score(score):
	score += score

func update_score():
	$score_text.text = score
