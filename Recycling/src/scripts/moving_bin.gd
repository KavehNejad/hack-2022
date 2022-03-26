extends KinematicBody2D

export (int) var speed = 10
onready var sprite = get_node("Sprite")

var velocity = 0
var viewport_size 
signal moving_bin_entered(score)

var bin_types
var current_bin_type = {}

var level = "Level 3"

func _ready():
	set_bin_types()
	viewport_size = get_viewport_rect().size
	current_bin_type = bin_types[0]
	set_image()


func set_bin_types():
	bin_types = _get_json("res://assets/data/bins.json")[level]


func _get_json(file_path):
	var file = File.new()
	file.open(file_path, file.READ)
	var text = file.get_as_text()
	file.close()
	return parse_json(text)


func _process(_delta):
	position.x = wrapf(position.x, 0, viewport_size.x) 


func _physics_process(_delta):
	get_input()
	position.x += velocity


func get_input():
	velocity = 0
	if Input.is_action_pressed("right"):
		velocity += 1
	if Input.is_action_pressed("left"):
		velocity -= 1
	if Input.is_action_just_pressed("up"):
		get_next_bin_type("up")
	if Input.is_action_just_pressed("down"):
		get_next_bin_type("down")
	velocity = velocity * speed


func get_next_bin_type(switch_direction):
	if (switch_direction == "up"):
		if (current_bin_type.id == (bin_types.size() - 1)):
			switch_bin_type(0)
		else:
			switch_bin_type(current_bin_type.id + 1)
	elif(switch_direction == "down"):
		if (current_bin_type.id == 0):
			switch_bin_type(bin_types.size() - 1)
		else:
			switch_bin_type(current_bin_type.id - 1)
	
func switch_bin_type(id):
	current_bin_type = bin_types[id]

	set_image()


func set_image():
	sprite.set_texture(load(current_bin_type.image_src))


func _on_Area2D_area_entered(area):
	if area.is_in_group('falling_object'):
		var points = calc_points(area)
		emit_signal("moving_bin_entered", points)
		area.destroy()


func calc_points(object):
	if object.type == current_bin_type.name:
		return object.points

	return -object.points
