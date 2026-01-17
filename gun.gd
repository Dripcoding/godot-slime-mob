extends Area2D


func _physics_process(_delta: float) -> void:
	var bodies: Array[Node2D] = get_overlapping_bodies()
	if bodies.size() > 0:
		print(bodies)
		var firstBodyPosition: Vector2 = bodies[0].global_position
		$PivotPoint.look_at(firstBodyPosition)	
