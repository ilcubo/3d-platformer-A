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


func _on_Timer_timeout():
	queue_free()


# warning-ignore: UNUSED_ARGUMENT
func _on_Cannonball_body_entered(body: Node):
	sleeping = true
	$ExplosionArea.monitoring = true
	$MeshInstance.queue_free()
	$CollisionShape.queue_free()
	yield(get_tree().create_timer(0.2), "timeout")
	queue_free()
