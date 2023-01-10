extends KinematicBody


export(int) var hp: int = 5

var can_attack: bool = true


func _damage(value: int) -> void:
	hp -= value
	if hp < 0:
		hp = 0

	if hp == 0:
		die()

func die() -> void:
	queue_free()

func _on_Area_body_entered(body: Node) -> void:
    if body is Player and $AttackTimer.is_stopped():
        body.call("damage", 1)
        print("attack")
        $AttackTimer.start()
