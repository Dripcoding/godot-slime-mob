extends Area2D


@export var speed: float = 300.0
@export var max_range: float = 1200.0

var travelled_distance: float = 0.0


func _physics_process(delta: float) -> void:
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * speed * delta
	travelled_distance += speed * delta
	
	if travelled_distance > max_range:
		queue_free()


func _on_body_entered(body: Node2D) -> void:
	queue_free() # free bullet instance after current frame ends
	print("body entered bullet 2d area")
	
	if body.has_method("take_damage"):
		body.take_damage()
