class_name GameUI extends CanvasLayer
@onready var laser_label: Label = $WeaponCounter/LaserCounter/Label
@onready var grenade_label: Label = $WeaponCounter/GrenadeCounter/Label
@onready var grenade_rect: TextureRect = $WeaponCounter/GrenadeCounter/TextureRect
@onready var laser_rect: TextureRect = $WeaponCounter/LaserCounter/TextureRect
@onready var health_bar: TextureProgressBar = $MarginContainer/TextureProgressBar


var green_color = Color.SEA_GREEN
var red_color = Color(0.9, 0, 0, 1)

func _ready() -> void:
	Global.stat_changed.connect(update_all)
	update_all()
	
func update_all() -> void:
	update_health_progress()
	update_laser_amount()
	update_grenade_amount()

func update_laser_amount() -> void:
	laser_label.text = str(Global.laser_amount)
	update_color(Global.laser_amount, laser_label, laser_rect)

func update_health_progress() -> void:
	health_bar.value = Global.health
	

func update_grenade_amount() -> void:
	grenade_label.text = str(Global.grenade_amount)
	update_color(Global.grenade_amount, grenade_label, grenade_rect)

func update_color(aoumt: int, text: Label, icon: TextureRect) -> void:
	if aoumt > 0:
		text.modulate = green_color
		icon.modulate = green_color
	else:
		text.modulate = red_color
		icon.modulate = red_color
		
	
	
