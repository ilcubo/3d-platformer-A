class_name Coin
extends StaticBody

func _collect(player_path:NodePath) -> void:
	get_node(player_path).call("add_score", 1)
	queue_free()
