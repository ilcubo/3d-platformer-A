extends Node

var state: int = 0
var coin: PackedScene = preload("res://Items/Coin.tscn")

func summon() -> void:
	if state == 0:
		state = 1
		var new_orb: Spatial = $Time1.duplicate()
		new_orb.set_script($Time1.get_script())
		new_orb.add_to_group("temp")
		new_orb.translation = $Position3D.translation
		add_child(new_orb)
		$Timer.start()
	elif state == 1 and !$Timer.is_stopped():
		state = 2
		var new_coin = coin.instance()
		add_child(new_coin)
		$Timer.stop()
		
func _on_Timer_timeout() -> void:
	var children_nodes = get_children()
	for child in children_nodes:
		if child.is_in_group("temp"):
			remove_child(child)