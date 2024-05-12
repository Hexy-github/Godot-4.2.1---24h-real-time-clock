extends Sprite2D
@export var speed_scale: = 1.0 
@onready var minutes: AnimationPlayer = $minutes
@onready var hours: AnimationPlayer = $hours
@onready var seconds: AnimationPlayer = $seconds

func _on_h_slider_value_changed(value: float) -> void:
	speed_scale = value
	$CanvasLayer/Control/HSlider/speed_scale.set_text(str(speed_scale))
	
	minutes.speed_scale = speed_scale
	hours.speed_scale = speed_scale
	seconds.speed_scale = speed_scale


func _set_time(s,m,h):
	var total_s = s + (m * 60 )+ (h * 3600)
	minutes.seek(total_s)
	seconds.seek(total_s)
	hours.seek(total_s)

func _on_button_pressed() -> void:
	_set_time(int($CanvasLayer/Control/s_set.text),int($CanvasLayer/Control/m_set.text),int($CanvasLayer/Control/h_set.text))
