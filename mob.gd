extends CharacterBody2D


@export var speed: float = 300.0
@export var health: int = 3


var explosion_scene: PackedScene = preload('res://smoke_explosion/smoke_explosion.tscn')


@onready var player: Node = get_node("/root/Game/Player")


func _ready() -> void:
	$Slime.play_walk()


func _physics_process(_delta: float) -> void:
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * speed
	move_and_slide()


func take_damage() -> void:
	health -= 1
	$Slime.play_hurt()
	
	if health == 0:
		queue_free()
		var explosion: Node2D = explosion_scene.instantiate()
		explosion.global_position = $Slime.global_position
		get_parent().add_child(explosion)
