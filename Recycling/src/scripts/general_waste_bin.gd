extends Area2D

signal general_waste_bin_entered(score)
signal wrong_bin(message)


func _on_general_waste_bin_area_entered(area):
	if area.is_in_group('falling_object'):
		var points = calc_points(area)
		if points != 0:
			emit_signal("general_waste_bin_entered", points)
			var message = get_alert_messages(area)
			emit_signal("wrong_bin", message)
		area.destroy()

func calc_points(object):
	if object.type == 'waste':
		return 0

	return -object.points

func get_alert_messages(object):
	if object.type != 'waste':
		var name = object.object_name
		
		var output = "The " + name + " was disposed of incorrectly."
		
		return output
	return "good keep going!"
