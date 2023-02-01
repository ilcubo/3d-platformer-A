extends RigidBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.


# warning-ignore: UNUSED_ARGUMENT
func _physics_process(delta: float) -> void:
	pass


func _on_Timer_timeout() -> void:
	queue_free()


# warning-ignore: UNUSED_ARGUMENT
func _on_Cannonball_body_entered(body: Node) -> void:
	sleeping = true
	linear_velocity = Vector3.ZERO
	angular_velocity = Vector3.ZERO

	if has_node("MeshInstance"):
		$MeshInstance.queue_free()

	if has_node("CollisionShape"):
		$CollisionShape.queue_free()

	$ExplosionArea.monitoring = true
	$Particles.emitting = true
	yield(get_tree().create_timer(0.1), "timeout")
	$Particles2.emitting = true
	yield(get_tree().create_timer(2), "timeout")
	queue_free()
