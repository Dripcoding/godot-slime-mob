extends Area2D


const bullet_scene: PackedScene = preload('res://bullet.tscn')


func _physics_process(_delta: float) -> void:
	var mobs_in_range: Array[Node2D] = get_overlapping_bodies()
	if mobs_in_range.size() > 0:
		var first = mobs_in_range[0]
		look_at(first.global_position)


func _on_timer_timeout() -> void:
	shoot()
	

func shoot() -> void:
	var bullet: Area2D = bullet_scene.instantiate()
	bullet.global_position = %BulletSpawn.global_position
	bullet.rotation = %BulletSpawn.global_rotation
	%BulletSpawn.add_child(bullet)
