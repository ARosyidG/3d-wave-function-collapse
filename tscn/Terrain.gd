extends GridMap


# Called when the node enters the scene tree for the first time.
@onready var Posibility = []
var terrain = null
func _ready():
	terrain = get_node("Terrain")
	Posibility = {
		"FlatSurface0" = {
			[0,0,0,0,1,0,0,0,0] : 0
		},
		"DiagonalSurface" = {
			[0,1,0,0,1,0,0,0,0] : 0,
			[0,0,0,1,1,0,0,0,0] : 90,
			[0,0,0,0,1,0,0,1,0] : 180,
			[0,0,0,0,1,1,0,0,0] : 270
		}
	}
	print(mesh_library.get_item_name(0))
	print(Posibility.keys())
	var terrainItemList = []
	for id in terrain.mesh_library.get_item_list():
		terrainItemList.append(terrain.mesh_library.get_item_name(id))
	print(terrainItemList)
#	terrainItemList.find("FlatSurface0")
	print(terrainItemList.find("FlatSurface0"))
	for x in range(-2,1):
		for z in range(-2,1): 
			set_cell_item(Vector3(x,-1,z),1,0)
	var used_cell = get_used_cells()
	for cell in used_cell:
		var cellProbability = []
		cellProbability.append(0 if get_cell_item(Vector3(cell.x-1, cell.y, cell.z-1)) == INVALID_CELL_ITEM else 1)#1-1
		cellProbability.append(0 if get_cell_item(Vector3(cell.x, cell.y, cell.z-1)) == INVALID_CELL_ITEM else 1)#1-2
		cellProbability.append(0 if get_cell_item(Vector3(cell.x+1, cell.y, cell.z-1)) == INVALID_CELL_ITEM else 1)#1-3
		cellProbability.append(0 if get_cell_item(Vector3(cell.x-1, cell.y, cell.z)) == INVALID_CELL_ITEM else 1)#2-1
		cellProbability.append(0 if get_cell_item(Vector3(cell.x, cell.y, cell.z)) == INVALID_CELL_ITEM else 1)#2-2
		cellProbability.append(0 if get_cell_item(Vector3(cell.x+1, cell.y, cell.z)) == INVALID_CELL_ITEM else 1)#2-3
		cellProbability.append(0 if get_cell_item(Vector3(cell.x-1, cell.y, cell.z+1)) == INVALID_CELL_ITEM else 1)#3-1
		cellProbability.append(0 if get_cell_item(Vector3(cell.x, cell.y, cell.z+1)) == INVALID_CELL_ITEM else 1)#3-2
		cellProbability.append(0 if get_cell_item(Vector3(cell.x+1, cell.y, cell.z+1)) == INVALID_CELL_ITEM else 1)#3-3
		print(cellProbability)
		terrain.set_cell_item(cell,terrainItemList.find("FlatSurface0"),0)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	print(get_used_cells())
	pass
