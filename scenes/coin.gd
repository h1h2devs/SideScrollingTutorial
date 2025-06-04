class_name Coin extends Area2D

@export var run_speed: float = 0.0
@export var coin_value: int = 0

func _process(delta: float) -> void:
	position.x -= run_speed * delta

func _on_body_entered(_body: Player) -> void:
	(Global as AGlobal).gold += coin_value
	queue_free()
