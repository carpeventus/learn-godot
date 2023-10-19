class_name ItemContainer extends StaticBody2D


@onready var current_direction = Vector2.DOWN.rotated(rotation)

var is_open: bool = false

signal opened(positon: Vector2, direction: Vector2)

func be_hit() -> void:
	pass

