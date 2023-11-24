extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var score = get_score()
	if score != null:
		if score>0:
			$Panel/title_phrase.text = "Well done!"
		else:
			$Panel/title_phrase.text = "Better luck next time!"
		
		$Panel/final_score_label.text = str(score)
	
	else:
		$Panel/title_phrase.text = "UPS!"
		$Panel/final_score_label.text = "Error:/"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func get_score():
	var parent_node = get_parent()
	if (parent_node.has_node("score_holder")):
		var score_holder = parent_node.get_node("score_holder")
		if score_holder.has_method("get_current_score"):
			return score_holder.get_current_score()
	return null
