extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore: UNUSED_ARGUMENT
func _process(delta) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		# warning-ignore: RETURN_VALUE_DISCARDED
		get_tree().change_scene("res://Levels/Hub/Hub.tscn")
