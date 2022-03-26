extends KinematicBody2D

export (int) var speed = 10

var velocity = 0
var viewport_size 
signal update_score(score)

func _ready():
	viewport_size = get_viewport_rect().size

func _process(delta):
	position.x = wrapf(position.x, 0, viewport_size.x) 

func _physics_process(delta):
	get_input()
	position.x += velocity

func get_input():
	velocity = 0
	if Input.is_action_pressed("right"):
		velocity += 1
	if Input.is_action_pressed("left"):
		velocity -= 1
	velocity = velocity * speed


func _on_Area2D_bin_entered(body):
	if body.is_in_group('falling_object'):
		var score = 0
		emit_signal("update_score", score)
