extends Node2D

export(float) var speed

func _physics_process(_delta):
	position.y += speed
