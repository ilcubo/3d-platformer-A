extends StaticBody

var scene_path: String = "res://Levels/Level1/Level1.tscn"

func _interact(_player_path: NodePath) -> void:
	#warning-ignore: RETURN_VALUE_DISCARDED
	get_tree().change_scene(scene_path)
