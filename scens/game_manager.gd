class_name LevelManagerBase extends Node2D

@onready var player: CharacterBody2D = $Player
@onready var camera_2d: Camera2D = $Camera2D
@onready var ui: GameUI = $UI as GameUI


var laser_scene : PackedScene = preload("res://player/weapons/laser.tscn")
var grenade_scene : PackedScene = preload("res://player/weapons/grenade.tscn")

	

func _on_player_laser_shooted(gloabal_positon : Vector2, player_direction : Vector2) -> void:
	generate_laser(gloabal_positon, player_direction)
	ui.update_laser_amount()

	

func _on_player_grenade_throwed(gloabal_positon : Vector2, player_direction : Vector2) -> void:
	generate_grenade(gloabal_positon, player_direction)
	ui.update_grenade_amount()

func generate_laser(player_positon : Vector2, direction : Vector2) -> void:
	var laser = laser_scene.instantiate() as Laser
	laser.position = player_positon
	laser.rotation = direction.angle()
	laser.change_direction(direction)
	$Projectiles.add_child(laser)

func generate_grenade(player_positon : Vector2, direction : Vector2) -> void:
	var grenade = grenade_scene.instantiate() as Grenade
	grenade.position = player_positon
	grenade.linear_velocity = direction * grenade.speed
	$Projectiles.add_child(grenade)
