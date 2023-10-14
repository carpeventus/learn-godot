class_name Laser extends Area2D

@export var speed := 2000.0

var direction := Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func change_direction(dir : Vector2) -> void:
	direction = dir


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += direction * speed * delta;
