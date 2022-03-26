extends Node2D

export(float) var SPEED

func _physics_process(_delta):
	position.y += SPEED
