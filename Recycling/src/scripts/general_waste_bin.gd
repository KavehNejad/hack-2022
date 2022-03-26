extends Area2D

signal general_waste_bin_entered(score)


func _on_general_waste_bin_area_entered(area):
	if area.is_in_group('falling_object'):
		var points = calc_points(area)
		if points != 0:
			emit_signal("general_waste_bin_entered", points)
		area.destroy()

func calc_points(object):
	if object.type == 'waste':
		return 0

	return -object.points
