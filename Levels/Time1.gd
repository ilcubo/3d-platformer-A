extends CSGSphere


func _interact(_player_path: NodePath) -> void:
	get_parent().summon()
