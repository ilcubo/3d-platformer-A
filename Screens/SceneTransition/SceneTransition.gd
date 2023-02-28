extends CanvasLayer


var current_scene: Node

func change_scene(target: String) -> void:
	print(current_scene)
	$AnimationPlayer.play("fade")
	yield($AnimationPlayer, "animation_finished")

	current_scene.free()

	var s: Resource = ResourceLoader.load(target)

	var new_scene: Node = s.instance()
	get_tree().get_root().add_child(new_scene)

	current_scene = new_scene
	$AnimationPlayer.play_backwards("fade")
	yield($AnimationPlayer, "animation_finished")
	get_tree().current_scene = current_scene
