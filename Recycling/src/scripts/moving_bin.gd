extends KinematicBody2D

export (int) var speed = 10

var velocity = 0
var viewport_size 
signal moving_bin_entered(score)

var bin_types = [{"name": "recycling", "id": 0}, {"name": "food waste", "id": 1}, {"name": "test", "id": 3}]
var current_bin_type = {"name": "", "id": 0}

func _ready():
	viewport_size = get_viewport_rect().size
	current_bin_type.name = bin_types[0].name
	current_bin_type.id = bin_types[0].id

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


func _on_Area2D_bin_entered(body):
	if body.is_in_group('falling_object'):
		var score = 0
		emit_signal("moving_bin_entered", score)

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
	
	var name = bin_types[id].name
	current_bin_type.name = name
	current_bin_type.id = id

	print(current_bin_type.name)
