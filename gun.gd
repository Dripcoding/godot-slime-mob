extends Area2D


func _physics_process(delta: float) -> void:
	var mobs_in_range: Array[Node2D] = get_overlapping_bodies()
	if mobs_in_range.size() > 0:
		var first = mobs_in_range[0]
		look_at(first.global_position)


func _on_timer_timeout() -> void:
	pass
	

func shoot() -> void:
	pass
