extends Node

var coin_scene: PackedScene = preload("res://Items/Coin.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

#warning-ignore: UNUSED_ARGUMENT
func _on_PressurePlate_body_entered(body:Node):
	var coin: Spatial = coin_scene.instance()
	coin.global_translation = $CoinPosition.global_translation
	add_child(coin)

