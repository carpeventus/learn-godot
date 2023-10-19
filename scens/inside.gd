extends LevelManagerBase

var init_camera_zoom_property : Vector2

func _ready() -> void:
	init_camera_zoom_property = camera_2d.zoom

func _on_house_player_enter_house(body:Node2D) -> void:
	create_tween().tween_property($Camera2D, "zoom", Vector2(1.5, 1.5), 1)


func _on_house_player_exited_house(body:Node2D) -> void:
	create_tween().tween_property($Camera2D, "zoom", init_camera_zoom_property, 1)


func _on_exited_area_body_entered(body: Node2D) -> void:
		create_tween().tween_property($Player, "move_speed", 0, 0.5)
		TranstionLayer.transtion_scene("res://scens/outside.tscn")
