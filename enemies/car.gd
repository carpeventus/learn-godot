extends PathFollow2D

@onready var line1: Line2D = $CharacterBody2D/Turret/RayCast2D/Line2D
@onready var line2: Line2D = $CharacterBody2D/Turret/RayCast2D2/Line2D
@onready var gun_fire: Sprite2D = $CharacterBody2D/Turret/GunFire
@onready var gun_fire2: Sprite2D = $CharacterBody2D/Turret/GunFire2
@onready var ray_cast: RayCast2D = $CharacterBody2D/Turret/RayCast2D
@onready var ray_cast2: RayCast2D = $CharacterBody2D/Turret/RayCast2D2

var player_nearby := false

func fire() -> void:
	gun_fire.modulate.a = 1
	gun_fire2.modulate.a = 1
	var tween = create_tween()
	tween.set_parallel(true)
	tween.tween_property(gun_fire, "modulate:a", 0.0, 0.4)
	tween.tween_property(gun_fire2, "modulate:a", 0.0, 0.4)
	Global.health -= 10

func _ready() -> void:
	line1.add_point(ray_cast.target_position)
	line2.add_point(ray_cast2.target_position)

func _process(delta: float) -> void:
	progress += 100 * delta
	if player_nearby:
		var player = get_tree().get_first_node_in_group("Player") as Node2D
		$CharacterBody2D/Turret.look_at(player.global_position)


func _on_notice_area_body_entered(body: Node2D) -> void:
	player_nearby = true
	$AnimationPlayer.play("aim")

func _on_notice_area_body_exited(body: Node2D) -> void:
	player_nearby = false
	$AnimationPlayer.play("RESET")
