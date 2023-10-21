class_name Scout extends CharacterBody2D

@onready var laser_cooldown_timer: Timer = $LaserCooldownTimer
@onready var vulnerable_timer: Timer = $VulnerableTimer

var vulnerable := false
var player_nearby := false
var can_laser := true
var another_gun := false
var health := 30

signal scout_laser(position: Vector2, direction: Vector2)

func be_hit() -> void:
	if vulnerable:
		return
		
	start_vulnera()
	health -= 10
	$Particles/HitParticles.emitting = true
	if health <=0:
		await get_tree().create_timer(0.5).timeout
		queue_free()
	
func start_vulnera() -> void:
	vulnerable = true
	$Sprite2D.material.set_shader_parameter("progress", 1.0)
	vulnerable_timer.start()
	await vulnerable_timer.timeout
	vulnerable = false
	$Sprite2D.material.set_shader_parameter("progress", 0.0)
	
func _process(delta: float) -> void:
	if player_nearby:
		var player = get_tree().get_first_node_in_group("Player") as Node2D
		look_at(player.global_position)
		if can_laser:
			var pos: Vector2 = $ScoutArea/Marker2D.global_position
			if another_gun:
				pos = $ScoutArea/Marker2D2.global_position
			another_gun = not another_gun
			start_cool_down()
			var direction: Vector2 = (player.global_position - global_position).normalized()
			scout_laser.emit(pos, direction)
			

func start_cool_down() -> void:
	can_laser = false
	laser_cooldown_timer.start()
	await laser_cooldown_timer.timeout
	can_laser = true
	

func _on_scout_area_body_entered(body: Node2D) -> void:
	player_nearby = true


func _on_scout_area_body_exited(body: Node2D) -> void:
	player_nearby = false
