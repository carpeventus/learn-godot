extends Area2D

signal player_enter_house
signal player_exited_house

func _on_body_entered(body: Node2D) -> void:
	player_enter_house.emit()



func _on_body_exited(body: Node2D) -> void:
	player_exited_house.emit()
