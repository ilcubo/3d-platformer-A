extends Area


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func _on_ExplosionArea_body_entered(body:Node):
	if body is Player:
		body.call("damage", 1)
