extends Node2D

onready var sprite = get_node("Sprite")

export(float) var speed
var type
var image_src
var points
var object_name

func _ready():
	set_image()

func _physics_process(_delta):
	position.y += speed

func set_image():
	sprite.set_texture(load(image_src))

func destroy():
	queue_free()
