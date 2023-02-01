extends Spatial


var player_scene: PackedScene = preload("res://Player/Player.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	var player: Spatial = player_scene.instance()
	player.translation = $PlayerSpawn.translation
	add_child(player)