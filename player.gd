class_name player extends CharacterBody2D


const SPEED     : float = 300.0   # top speed (px / s)
const FRICTION  : float = 1500.0   # how fast we slow to a stop (px / s²)

func _physics_process(delta: float) -> void:
	#  Get normalised input (↔ uses actions: LEFT, RIGHT, UP, DOWN)
	var input_dir: Vector2 = Input.get_vector("LEFT", "RIGHT", "UP", "DOWN")

	#  Accelerate or brake
	if input_dir != Vector2.ZERO:
		velocity = input_dir * SPEED
	else:
		# decelerate smoothly toward 0 using delta‑scaled friction
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)

	move_and_slide()
