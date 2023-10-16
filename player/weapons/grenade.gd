class_name Grenade extends RigidBody2D

@export var speed := 200.0


func explosion() -> void:
	$AnimationPlayer.play("explosion")
