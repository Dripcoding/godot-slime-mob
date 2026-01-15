extends CharacterBody2D


@export var speed: float = 300.0


func _physics_process(_delta: float) -> void:
	var direction: Vector2 = Input.get_vector("Left", "Right", "Up", 'Down')
	velocity = direction * speed
	move_and_slide()
