extends Node2D


var mob_scene: PackedScene = preload('res://mob.tscn')


func spawn_mob() -> void:
	var mob: Node2D = mob_scene.instantiate()
	%PathFollow2D.progress_ratio = randf()
	mob.global_position = %PathFollow2D.global_position
	add_child(mob)
	

func _on_timer_timeout() -> void:
	spawn_mob()
