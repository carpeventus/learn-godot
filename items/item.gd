class_name Item extends Area2D

@export var speed: float = 4.0

enum ItemOption {LASER, GRENADE, HEALTH}

var item_options: Array[ItemOption] = [ItemOption.LASER, ItemOption.LASER, ItemOption.LASER, ItemOption.LASER,
ItemOption.GRENADE, ItemOption.HEALTH]

var type: ItemOption = item_options[randi() % len(item_options)]


func _ready() -> void:
	body_entered.connect(on_player_entered)

	match type:
		ItemOption.GRENADE:
			$Sprite2D.modulate = Color.DARK_RED
		ItemOption.LASER:
			$Sprite2D.modulate = Color.DARK_BLUE
		ItemOption.HEALTH:
			$Sprite2D.modulate = Color.DARK_GREEN
		
func _process(delta: float) -> void:
	rotation += delta * speed

func on_player_entered(body: Node2D) -> void:
		var player = body as Player
		player.add_item(type)
		queue_free()
	
	
