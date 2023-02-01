tool
extends GridMap

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(160, 164):
		mesh_library.set_item_mesh_transform(i, Transform(Vector3(5, 0, 0), Vector3(0, 5, 0), Vector3(0, 0, 5), Vector3(0, 0, 0)))



