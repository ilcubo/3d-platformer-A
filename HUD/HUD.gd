extends Control


func _update_hp(value: int) -> void:
	$HpLabel.text = "{value}".format({"value": value})
