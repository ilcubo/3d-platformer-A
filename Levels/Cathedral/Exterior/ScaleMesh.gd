tool
extends GridMap

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(264, 329):
		mesh_library.set_item_mesh_transform(i, Transform(Vector3(10, 0, 0), Vector3(0, 10, 0), Vector3(0, 0, 10), Vector3(0, 0, 0)))



