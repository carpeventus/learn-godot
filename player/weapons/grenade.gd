class_name Grenade extends RigidBody2D

@export var speed := 200.0
@export var explosion_range := 300.0
var explosion_active := false

func explosion() -> void:
	$AnimationPlayer.play("explosion")
	var nodes: Array[Node] = get_tree().get_nodes_in_group("ItemContainer") + get_tree().get_nodes_in_group("Player") + get_tree().get_nodes_in_group("Etity")
	for n in nodes:
		var entity := n as Node2D
		var in_range: bool = entity.global_position.distance_to(global_position) < explosion_range
		if in_range and entity.has_method("be_hit"):
			entity.be_hit()
