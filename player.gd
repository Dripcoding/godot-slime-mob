extends CharacterBody2D


@export var speed: float = 300.0


func _physics_process(_delta: float) -> void:
	var direction: Vector2 = Input.get_vector("Left", "Right", "Up", 'Down')
	velocity = direction * speed
	move_and_slide()
	
	# trigger animations depending on velocity vector len
	if velocity.length() > 0:
		$HappyBoo.play_walk_animation()
	else:
		$HappyBoo.play_idle_animation()
