extends KinematicBody

export(int) var speed
export(int) var jump_power
export(float) var acceleration
export(float) var deceleration

onready var gravity: float = -ProjectSettings.get_setting("physics/3d/default_gravity")

var velocity: Vector3
var detected_object: Spatial
var score: int

# warning-ignore: UNUSED_ARGUMENT
func _process(delta) -> void:
	if detected_object != null:
		$HUD/Interact.visible = true
	else:
		$HUD/Interact.visible = false

	if Input.is_action_just_pressed("interact") and detected_object != null:
		detected_object.call("_interact", get_path())

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

	velocity = move_and_slide(velocity, Vector3.UP, true)

	if velocity.y > 0.05:
		$fox/AnimationPlayer.play("Jump")
	elif velocity.y < -0.05 and !is_on_floor():
		$fox/AnimationPlayer.play("Fall")
	
	detect_trap()

func collect(body: Spatial):
	body.call("_collect", get_path())

func _on_ObjectDetector_body_entered(body: Spatial) -> void:
	if body.get_collision_layer_bit(1):
		collect(body)
	elif body.get_collision_layer_bit(2):
		detected_object = body

func _on_ObjectDetector_body_exited(body: Spatial) -> void:
	if body.get_collision_layer_bit(2):
		detected_object = null

func add_score(num: int) -> void:
	score += num
	$HUD._update_score(score)

func detect_trap() -> void:
	for i in get_slide_count():
		var collision: KinematicCollision = get_slide_collision(i)

		if !collision.collider is PhysicsBody:
			break

		if collision.collider.get_collision_layer_bit(5):
			$HUD/GameOver.visible = true
			get_tree().paused = true
