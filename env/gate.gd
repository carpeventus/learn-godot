extends StaticBody2D

signal gate_entered(body : Node2D)

func on_area_body_entered(body: Node2D) -> void:
	gate_entered.emit(body)
