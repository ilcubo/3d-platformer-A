extends Spatial


var player_scene: PackedScene = preload("res://Player/Player.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.spawn_pos == "":
		Global.spawn_pos = "Spawn/Default"

	var player: Spatial = player_scene.instance()
	player.translation = get_node(Global.spawn_pos).translation
	player.get_node("fox").rotation.y = get_node(Global.spawn_pos).rotation.y
	player.get_node("CameraPivot").rotation.y = get_node(Global.spawn_pos).rotation.y
	add_child(player)
	


