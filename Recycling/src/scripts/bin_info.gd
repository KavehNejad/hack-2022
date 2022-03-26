extends Node2D

onready var bin_image = get_node("bin_image")
onready var bin_name_label = get_node("bin_name_label")

func set_up(bin):
	if bin == null:
		visible = false
		return

	visible = true
	bin_image.set_texture(load(bin.image_src))
	bin_name_label.text = bin.name
