extends Spatial


var player_scene: PackedScene = preload("res://Player/Player.tscn")


func _ready():
	if Global.spawn_pos == "":
		Global.spawn_pos = "Spawn/Default"

	var player: Spatial = player_scene.instance()
	player.global_translation = get_node(Global.spawn_pos).global_translation
	add_child(player)