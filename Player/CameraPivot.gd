extends Position3D

export(int) var sensitivity
export(float) var min_angle
export(float) var max_angle

var mouse_movement: Vector2 = Vector2.ZERO

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event) -> void:
	if event is InputEventMouseMotion:
		mouse_movement = event.relative
	if event is InputEventJoypadMotion:
		if Input.get_joy_axis(0, JOY_AXIS_2) >= 0.1 or Input.get_joy_axis(0, JOY_AXIS_2) <= -0.1:
			mouse_movement.x = Input.get_joy_axis(0, JOY_AXIS_2) * 20
		if Input.get_joy_axis(0, JOY_AXIS_3) >= 0.1 or Input.get_joy_axis(0, JOY_AXIS_2) <= -0.1:
			mouse_movement.y = Input.get_joy_axis(0, JOY_AXIS_3) * 20

# warning-ignore: UNUSED_ARGUMENT
func _process(delta: float) -> void:
	var rot = Vector3(mouse_movement.y, mouse_movement.x, 0) * sensitivity * delta

	rotation_degrees.x += rot.x
	rotation_degrees.x = clamp(rotation_degrees.x, min_angle, max_angle)

	rotation_degrees.y -= rot.y
	
	mouse_movement = Vector2.ZERO
