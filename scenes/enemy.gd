class_name Enemy extends Area2D

@export var run_speed: float = 0.0
@export var damage: float = 0.0
@onready var sprite: AnimatedSprite2D = %Sprite

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= run_speed * delta


func _on_body_entered(body: Player) -> void:
	sprite.play("hit")
	body.take_damage(damage)

func _on_sprite_animation_finished() -> void:
	queue_free()
