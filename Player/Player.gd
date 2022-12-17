extends KinematicBody

export(int) var speed
export(int) var jump_power
export(float) var acceleration
export(float) var deceleration

onready var gravity: float = -ProjectSettings.get_setting("physics/3d/default_gravity")

var velocity: Vector3

var score: int


func _physics_process(delta: float) -> void:
	var direction: Vector3 = Vector3.ZERO

	direction.x = Input.get_action_strength("move_left") - Input.get_action_strength("move_right")
	direction.z = Input.get_action_strength("move_forward") - Input.get_action_strength("move_backward")
	direction = direction.normalized().rotated(Vector3.UP, $CameraPivot.rotation.y)
	
	var velocity_h: Vector3 = velocity
	velocity_h.y = 0
	
	var speed_change: float
	if speed < velocity_h.length():
		speed_change = acceleration 
	else:
		speed_change = deceleration
		
	if direction != Vector3.ZERO:
		$fox.rotation.y = lerp($fox.rotation.y, $CameraPivot.rotation.y, 0.7)
	
	velocity_h = velocity_h.linear_interpolate(direction * speed, speed_change)
	velocity.x = velocity_h.x
	velocity.z = velocity_h.z
	velocity.y += gravity * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_power
	
	if direction != Vector3.ZERO:
		$fox/AnimationPlayer.play("Run")
	else:
		$fox/AnimationPlayer.play("Idle")

	velocity = move_and_slide(velocity, Vector3.UP)

	if velocity.y > 0.05:
		$fox/AnimationPlayer.play("Jump")
	elif velocity.y < -0.05:
		$fox/AnimationPlayer.play("Fall")

func _on_ObjectDetector_body_entered(body:Node) -> void:
	body.call("_collect")
	score += 1
	$HUD.call("_update_score", score)
