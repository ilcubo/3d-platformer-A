extends StaticBody

var scene_path: String = "res://Levels/Level2/Level2.tscn"

func _interact(_player_path: NodePath) -> void:
	#warning-ignore: RETURN_VALUE_DISCARDED
	get_tree().change_scene(scene_path)
