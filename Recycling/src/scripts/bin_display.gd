extends Node2D

onready var current_bin_node = get_node("current_bin")
onready var next_bin_node = get_node("next_bin")
onready var previous_bin_node = get_node("previous_bin")

func _on_moving_bin_bin_changed(current_bin, next_bin, previous_bin):
	current_bin_node.set_up(current_bin)
	next_bin_node.set_up(next_bin)
	previous_bin_node.set_up(previous_bin)
