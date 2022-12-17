extends Control


func _update_score(score: int) -> void:
	$ScoreLabel.text = "{score}".format({"score": score})
