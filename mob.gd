extends CharacterBody2D


@export var speed: float = 300.0
@onready var player: Node = get_node("/root/Game/Player")


func _physics_process(_delta: float) -> void:
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * speed
	move_and_slide()
