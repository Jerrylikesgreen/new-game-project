class_name Mob extends CharacterBody2D

@export var _is_active: bool = false
@export var _is_moving: bool = false
@export var speed = 400


var target_position = position

func _input(event):
	if _is_active == true and event.is_action_pressed(&"CLICK"):
		target_position = get_global_mouse_position()
		_is_moving = true
		print("CLICK")

func _physics_process(delta):
	if _is_moving == true:
		velocity = position.direction_to(target_position) * speed
		if position.distance_to(target_position) > 10:
			move_and_slide()
			_is_active = false
			toogle_show_is_active(Color(1.0, 1.0, 1.0))
			


func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed(&"SELECT"):
		if _is_active == false:
			_is_active = true
			toogle_show_is_active(Color(0.87, 0.18, 0.604))
			print(_is_active)
		else:
			print(_is_active)
			return

func toogle_show_is_active(color) -> void:
	set_modulate(color)
