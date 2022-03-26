extends Node2D

onready var sprite = get_node("Sprite")

export(float) var speed
var type
var image_src

func _ready():
	set_image()

func _physics_process(_delta):
	position.y += speed

func set_image():
	sprite.set_texture(load(image_src))
