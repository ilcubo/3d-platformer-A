extends KinematicBody


export(int) var hp = 5





func _on_Area_body_entered(body:Node):
    if body is Player:
        body.call("damage", 1)
