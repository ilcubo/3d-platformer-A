extends CanvasLayer


func change_scene(target: String) -> void:
	$AnimationPlayer.play("slide_in")
	yield($AnimationPlayer, "animation_finished")
	# warning-ignore: RETURN_VALUE_DISCARDED
	get_tree().change_scene(target)
	$AnimationPlayer.play("slide_out")
