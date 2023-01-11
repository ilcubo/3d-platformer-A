extends Area


export(String) var target_scene
export(String) var target_spawn_pos


# warning-ignore: UNUSED_ARGUMENT
func _interact(player: Player) -> void:
	Global.spawn_pos = target_spawn_pos
	# warning-ignore: RETURN_VALUE_DISCARDED
	get_tree().change_scene(target_scene)
