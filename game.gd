extends Node2D

@export var player: Player
@export var scroll_speed : float = 0.0
@export var seconds_per_minute: int = 0
@export var scroll_speed_increase: float = 0

@onready var sky_free: Parallax2D = %SkyFree
@onready var mountains: Parallax2D = %Mountains
@onready var trees: Parallax2D = %Trees
@onready var ground: Parallax2D = %Ground

#timer to increase scroll speed
var round_timer: float = 0.0
#sets the minutes
var minute : int:
	set(value):
		minute = value
		%Minute.text = str(value).lpad(2,'0')
#sets the seconds
var second: int:
	set(value):
		second = value
		if second >= seconds_per_minute:
			second -= seconds_per_minute
			minute += 1
		%Second.text = str(value).lpad(2,'0')

func _ready() -> void:
	set_scroll_speed() # sets the scroll speed and text if ur gona have a speed text
	%health.text = " Health: " + str(player.health)

func _process(delta: float) -> void:
	increase_scroll_speed(delta)
	set_scroll_speed()

func set_scroll_speed() -> void:
	player.sprite.speed_scale = scroll_speed / 100
	sky_free.autoscroll.x = -scroll_speed
	mountains.autoscroll.x = -scroll_speed
	trees.autoscroll.x = -scroll_speed
	ground.autoscroll.x = -scroll_speed
	$UI/Control/Label.text = "Speed: " + str(scroll_speed)

func increase_scroll_speed(delta) -> void:
	round_timer += delta
	if round_timer >= seconds_per_minute:
		round_timer = 0.0
		scroll_speed += scroll_speed_increase

func _on_timer_timeout() -> void:
	second += 1

func _on_button_button_down() -> void:
	pass
	if player.can_jump == true:
		player.jump()
	# prevents double jumping
	%Button.set_deferred("disabled", true)
	await get_tree().create_timer(0.8).timeout
	%Button.set_deferred("disabled", false)
