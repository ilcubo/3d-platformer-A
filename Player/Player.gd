class_name Player
extends KinematicBody


export(int) var hp_max
export(int) var attack_damage
export(int) var defense

export(int) var speed
export(int) var jump_power
export(float) var acceleration
export(float) var deceleration

onready var gravity: float = -ProjectSettings.get_setting("physics/3d/default_gravity")

var hp: int
var velocity: Vector3
var detected_object: Spatial


func _ready() -> void:
	hp = hp_max
	$HUD._update_hp(hp)

# warning-ignore: UNUSED_ARGUMENT
func _process(delta: float) -> void:
	if detected_object != null:
		$HUD/Interact.visible = true
	else:
		$HUD/Interact.visible = false

	if Input.is_action_just_pressed("interact") and detected_object != null:
		detected_object.call("_interact", get_path())

# warning-ignore: UNUSED_ARGUMENT
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
	
	velocity_h = velocity_h.linear_interpolate(direction * speed, speed_change)
	velocity.x = velocity_h.x
	velocity.z = velocity_h.z
	velocity.y += gravity * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_power

	velocity = move_and_slide(velocity, Vector3.UP, true)

	if direction != Vector3.ZERO:
		$fox/AnimationPlayer.play("Run")
		$fox.rotation.y = lerp($fox.rotation.y, atan2(velocity.x, velocity.z), 0.7)
	else:
		$fox/AnimationPlayer.play("Idle")

	if velocity.y > 0.05:
		$fox/AnimationPlayer.play("Jump")
	elif velocity.y < -0.05 and !is_on_floor():
		$fox/AnimationPlayer.play("Fall")

	# Attack
	if Input.is_action_just_pressed("attack"):
		var enemies = $fox/Hitbox.get_overlapping_bodies()
		for enemy in enemies:
			enemy.call("_damage", attack_damage)

func damage(value: int) -> void:
	hp -= value
	if hp < 0:
		hp = 0

	$HUD._update_hp(hp)

	if hp == 0:
		die()

func die() -> void:
	# warning-ignore: RETURN_VALUE_DISCARDED
	get_tree().change_scene("res://Screens/GameOver/GameOver.tscn")

func heal(value: int) -> void:
	hp += value
	$HUD._update_hp(hp)

func _on_ObjectDetector_body_entered(body: Spatial) -> void:
	if body.get_collision_layer_bit(2):
		detected_object = body

func _on_ObjectDetector_body_exited(body: Spatial) -> void:
	if body.get_collision_layer_bit(2):
		detected_object = null

func _on_ObjectDetector_area_entered(area:Area) -> void:
	if area.get_collision_layer_bit(2):
		detected_object = area

func _on_ObjectDetector_area_exited(area:Area) -> void:
	if area.get_collision_layer_bit(2):
		detected_object = null
