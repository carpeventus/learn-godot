extends CharacterBody2D

@export var max_speed := 500.0
var move_speed :float = max_speed

#region onready nodes
@onready var shoot_cool_down_timer: Timer = $ShootCoolDownTimer
@onready var grenade_reload_timer: Timer = $GrenadeReloadTimer
#endregion

#region signal
signal laser_shooted(gloabal_positon : Vector2, direction : Vector2)
signal grenade_throwed(gloabal_positon : Vector2, direction : Vector2)
#endregion


#region vars
var can_shoot := true;
var can_grenade := true;
var input_movement := Vector2.ZERO
var direction := Vector2.ZERO
#endregion

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _physics_process(_delta: float) -> void:
	var move_velocity = move_speed * direction
	velocity = move_velocity
	move_and_slide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	handle_input()
	look_at(get_global_mouse_position())


func handle_input() -> void:
	input_movement = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	direction = input_movement.normalized();
	if Input.is_action_just_pressed("primary_action") and can_shoot:
		shoot()
		direction = input_movement.normalized();
	if Input.is_action_just_pressed("secondary_action") and can_grenade:
		grenade()
		

func shoot() -> void:
	$GPUParticles2D.emitting = true
	can_shoot = false;
	var player_direction = (get_global_mouse_position() - global_position).normalized()
	laser_shooted.emit($ShootMarker.global_position, player_direction)
	shoot_cool_down_timer.start()
	await shoot_cool_down_timer.timeout
	can_shoot = true
	
	

func grenade() -> void:
	grenade_reload_timer.start()
	can_grenade = false;
	var player_direction = (get_global_mouse_position() - global_position).normalized()
	grenade_throwed.emit($ShootMarker.global_position, player_direction)
	await grenade_reload_timer.timeout
	can_grenade = true
