extends Control


# warning-ignore: UNUSED_ARGUMENT
func _process(delta):
	if Input.is_action_just_pressed("pause") and !get_node("../GameOver").visible:
		visible = !visible
		get_tree().paused = !get_tree().paused
		if get_tree().paused:
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		else:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED