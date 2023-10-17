extends LevelManagerBase



func _on_house_player_enter_house(body:Node2D) -> void:
	create_tween().tween_property($Camera2D, "zoom", Vector2(1.5, 1.5), 1)


func _on_house_player_exited_house(body:Node2D) -> void:
	create_tween().tween_property($Camera2D, "zoom", init_camera_zoom_property, 1)


func _on_exited_area_body_entered(body: Node2D) -> void:
		create_tween().tween_property($Player, "move_speed", 0, 0.5)
		get_tree().change_scene_to_file("res://scens/outside.tscn")
