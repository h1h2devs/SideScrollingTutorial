extends Node2D

@export var scroll_speed : float = 0.0
@export var seconds_per_minute: int = 0
@export var scroll_speed_increase: float = 0

@onready var parallax: Parallax2D = %Parallax2D

var round_timer: float = 0.0

var minute : int:
	set(value):
		minute = value
		%Minute.text = str(value).lpad(2,'0')

var second: int:
	set(value):
		second = value
		if second >= seconds_per_minute:
			second -= seconds_per_minute
			minute += 1
		%Second.text = str(value).lpad(2,'0')

func _ready() -> void:
	set_scroll_speed()

func _process(delta: float) -> void:
	increase_scroll_speed(delta)
	set_scroll_speed()
	

func set_scroll_speed() -> void:
	parallax.autoscroll.x = -scroll_speed
	$UI/Control/Label.text = "Speed: " + str(scroll_speed)

func increase_scroll_speed(delta) -> void:
	round_timer += delta
	if round_timer >= seconds_per_minute:
		round_timer = 0.0
		scroll_speed += scroll_speed_increase

func _on_timer_timeout() -> void:
	second += 1
