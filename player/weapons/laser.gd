class_name Laser extends Area2D

@export var speed := 2000.0

var direction := Vector2.ZERO

func _ready() -> void:
	$DestroyTimer.timeout.connect(destroy)
	$DestroyTimer.start()


func destroy() -> void:
	queue_free()
	
# Called when the node enters the scene tree for the first time.
func change_direction(dir : Vector2) -> void:
	direction = dir


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += direction * speed * delta;



func _on_body_entered(body: Node2D) -> void:
	if body.has_method("be_hit"):
		body.be_hit()
	queue_free()
		
