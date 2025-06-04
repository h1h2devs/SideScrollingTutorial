class_name Spawner extends Node2D

@export var spawn_objects: Array[PackedScene] = []

func spawn() -> void:
	var rand_obj = spawn_objects.pick_random()
	var instance = rand_obj.instantiate()
	get_tree().current_scene.add_child(instance)
	instance.position = position

func _on_timer_timeout() -> void:
	spawn()
