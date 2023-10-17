extends LevelManagerBase

func _on_gate_gate_entered(body:Node2D) -> void:
	create_tween().tween_property($Player, "move_speed", 0, 0.5)
	get_tree().change_scene_to_file("res://scens/inside.tscn")
	
