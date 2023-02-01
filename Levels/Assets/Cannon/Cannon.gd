extends Spatial


export(float) var cooldown


var cannonball_scene: PackedScene = preload("res://Levels/Assets/Cannon/Cannonball.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.wait_time = cooldown


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	var cannonball: RigidBody = cannonball_scene.instance()
	cannonball.global_translation = $BallSummon.global_translation
	cannonball.add_force(Vector3(20000, 1, 0), Vector3.ZERO)
	get_parent().add_child(cannonball)

