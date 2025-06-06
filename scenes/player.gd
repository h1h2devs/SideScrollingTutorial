class_name Player extends CharacterBody2D

@export var JUMP_VELOCITY = 0.0

@export var health: float:
	set(value):
		health = value

@onready var sprite: AnimatedSprite2D = %Sprite
var can_jump :bool = false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	if is_on_floor():
		can_jump = true
	if Input.is_action_just_pressed("jump") and can_jump:
		jump()
	move_and_slide()

func jump() -> void:
	velocity.y = JUMP_VELOCITY
	can_jump = false

func take_damage(amount: float) -> void:
	health -= amount
	%health.text = " Health: " + str(health)
	if health <= 0:
		print("GAME OVER")
