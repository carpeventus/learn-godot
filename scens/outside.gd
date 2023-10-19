extends LevelManagerBase

func _on_gate_gate_entered(body:Node2D) -> void:
	create_tween().tween_property($Player, "move_speed", 0, 0.5)
	TranstionLayer.transtion_scene("res://scens/inside.tscn")
	
