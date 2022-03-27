extends Control


func set_up_object(object, bin):
	$description.text = object['description']
	$name_label.text = object['type']
	$object_sprite.set_texture(load(object['image_src']))
	if bin == null:
		$bin_sprite.visible = false
		$bin_title.visible = false
		return
	$bin_sprite.set_texture(load(bin['image_src']))

