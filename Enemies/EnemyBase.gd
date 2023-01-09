extends KinematicBody


export(int) var hp = 5

var can_attack: bool = true


func _on_Area_body_entered(body:Node) -> void:
    if body is Player and $AttackTimer.is_stopped():
        body.call("damage", 1)
        print("attack")
        $AttackTimer.start()
