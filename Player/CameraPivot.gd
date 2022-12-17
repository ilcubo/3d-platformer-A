extends Position3D

export(int) var sensitivity
export(float) var min_angle
export(float) var max_angle

var mouse_movement: Vector2 = Vector2.ZERO

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event):
	if event is InputEventMouseMotion:
		mouse_movement = event.relative

func _process(delta):
	var rot = Vector3(mouse_movement.y, mouse_movement.x, 0) * sensitivity * delta

	rotation_degrees.x += rot.x
	rotation_degrees.x = clamp(rotation_degrees.x, min_angle, max_angle)

	rotation_degrees.y -= rot.y
	
	mouse_movement = Vector2.ZERO
