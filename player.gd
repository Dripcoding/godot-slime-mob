extends CharacterBody2D


signal health_depleted


@export var speed: float = 300.0
@export var health: float = 100.0
@export var damage_rate: float = 5.0


func _ready() -> void:
	%HealthBar.value = health


func _physics_process(delta: float) -> void:
	var direction: Vector2 = Input.get_vector("Left", "Right", "Up", 'Down')
	velocity = direction * speed
	move_and_slide()
	
	# trigger animations depending on velocity vector len
	if velocity.length() > 0:
		$HappyBoo.play_walk_animation()
	else:
		$HappyBoo.play_idle_animation()

	var mobs_in_range = $HurtBox.get_overlapping_bodies()
	var mob_count = mobs_in_range.size()
	if mob_count > 0:
		health -= damage_rate * mob_count * delta
		%HealthBar.value = health
		if health == 0:
			health_depleted.emit()
