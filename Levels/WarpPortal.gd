extends Area


export(String) var target_scene


# warning-ignore: UNUSED_ARGUMENT
func _interact(player: Player) -> void:
	# warning-ignore: RETURN_VALUE_DISCARDED
	get_tree().change_scene(target_scene)
