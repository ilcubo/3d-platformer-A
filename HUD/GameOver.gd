extends Control


var hub_path: String = "res://Levels/Hub/Hub.tscn"


# warning-ignore: UNUSED_ARGUMENT
func _process(delta):
	if Input.is_action_just_pressed("ui_accept") and visible:
		# warning-ignore: RETURN_VALUE_DISCARDED
		get_tree().change_scene(hub_path)
