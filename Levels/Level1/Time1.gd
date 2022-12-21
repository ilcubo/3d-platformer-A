extends CSGSphere


# warning-ignore: UNUSED_ARGUMENT
func _interact(player_path: NodePath) -> void:
	get_parent().summon()
