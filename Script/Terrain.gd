@tool
extends GridMap


# Called when the node enters the scene tree for the first time.
@export var update = false
@onready var PosibilityDIctinary = []
@onready var terrainItemList = []
@onready var rng = RandomNumberGenerator.new()
@onready var sizex = 150
@onready var sizez = 150
var terrain = null
func _ready():
	print("lol")
	terrain = get_node("Terrain")
#	for cell in used_cell:
#		print(cell)
#	for cell in terrain.get_used_cells():
#		terrain.set_cell_item(cell,INVALID_CELL_ITEM,0)
	PosibilityDIctinary = {
		"FlatSurface0" = {
			[1, 1, 1, 0, 1, 0, 1, 1, 1] : 0,
			[0, 1, 1, 1, 1, 0, 0, 1, 1] : 0,
			[1, 0, 1, 0, 1, 0, 0, 0, 1] : 0,
			[1, 0, 1, 1, 1, 1, 1, 0, 1] : 0,
			[1, 1, 0, 0, 1, 1, 1, 1, 0] : 0,
			[1, 0, 0, 1, 1, 1, 1, 0, 0] : 0,
			[1, 0, 1, 1, 1, 1, 1, 0, 0] : 0,
			[1, 0, 1, 1, 1, 1, 0, 0, 1] : 0,
			[0, 0, 1, 1, 1, 1, 1, 0, 0] : 0,
			[1, 1, 1, 0, 1, 0, 1, 1, 0] : 0,
			[0, 1, 0, 1, 1, 0, 0, 1, 0] : 0,
			[0, 0, 1, 1, 1, 1, 0, 0, 1] : 0,
			[1, 1, 1, 0, 1, 0, 0, 1, 0] : 0,
			[1, 0, 0, 1, 1, 1, 0, 0, 1] : 0,
			[0, 1, 0, 1, 1, 1, 0, 0, 1] : 0,
			[0, 0, 1, 0, 1, 0, 1, 0, 1] : 0,
			[1, 0, 1, 0, 1, 0, 1, 0, 1] : 0,
			[0, 1, 0, 1, 1, 0, 0, 1, 1] : 0,
			[1, 0, 0, 0, 1, 0, 1, 0, 1] : 0,
			[1, 1, 1, 1, 1, 1, 0, 1, 0] : 0,
			[1, 1, 1, 0, 1, 0, 0, 1, 1] : 0,
			[0, 1, 0, 0, 1, 0, 1, 1, 0] : 0,
			[0, 1, 0, 1, 1, 1, 1, 0, 0] : 0,
			[0, 1, 0, 0, 1, 1, 1, 1, 0] : 0,
			[1, 0, 1, 1, 1, 1, 0, 1, 0] : 0,
			[1, 1, 0, 0, 1, 0, 1, 1, 1] : 0,
			[0, 0, 1, 1, 1, 1, 0, 1, 0] : 0,
			[1, 0, 1, 1, 1, 1, 0, 0, 0] : 0,
			[0, 1, 1, 1, 1, 0, 0, 1, 0] : 0,
			[0, 0, 1, 1, 1, 1, 1, 0, 1] : 0,
			[1, 1, 0, 1, 1, 1, 1, 1, 0] : 0,
			[0, 1, 0, 0, 1, 0, 0, 1, 0] : 0,
			[0, 0, 0, 0, 1, 0, 0, 0, 0] : 0,
			[0, 1, 1, 0, 1, 0, 1, 1, 0] : 0,
			[1, 1, 0, 0, 1, 0, 0, 1, 1] : 0,
			[0, 1, 0, 0, 1, 1, 0, 1, 0] : 0,
			[1, 1, 0, 0, 1, 1, 0, 1, 0] : 0,
			[0, 0, 1, 0, 1, 0, 0, 0, 0] : 0,
			[0, 0, 0, 0, 1, 0, 0, 0, 1] : 0,
			[1, 1, 0, 0, 1, 0, 1, 1, 0] : 0,
			[0, 0, 0, 1, 1, 1, 0, 0, 0] : 0,
			[1, 0, 0, 0, 1, 0, 0, 0, 0] : 0,
			[0, 0, 1, 0, 1, 0, 1, 0, 0] : 0,
			[1, 0, 1, 0, 1, 0, 0, 0, 0] : 0,
			[0, 0, 0, 0, 1, 0, 1, 0, 0] : 0,
			[1, 0, 0, 0, 1, 0, 1, 0, 0] : 0,
			[0, 1, 0, 0, 1, 0, 1, 1, 1] : 0,
			[0, 0, 1, 0, 1, 0, 0, 0, 1] : 0,
			[0, 0, 1, 1, 1, 1, 0, 0, 0] : 0,
			[1, 0, 0, 1, 1, 1, 1, 0, 1] : 0,
			[0, 1, 1, 0, 1, 0, 0, 1, 0] : 0,
			[0, 1, 0, 1, 1, 1, 1, 1, 1] : 0,
			[0, 1, 0, 1, 1, 1, 0, 0, 0] : 0,
			[0, 1, 1, 0, 1, 0, 1, 1, 1] : 0,
			[0, 0, 0, 1, 1, 1, 1, 0, 1] : 0,
			[1, 0, 0, 0, 1, 0, 0, 0, 1] : 0,
			[1, 0, 0, 1, 1, 1, 0, 0, 0] : 0,
			[0, 0, 0, 0, 1, 0, 1, 0, 1] : 0,
			[0, 1, 0, 0, 1, 0, 0, 1, 1] : 0,
			[0, 1, 1, 0, 1, 0, 0, 1, 1] : 0,
			[0, 0, 0, 1, 1, 1, 1, 0, 0] : 0,
			[0, 0, 0, 1, 1, 1, 0, 1, 0] : 0,
			[0, 1, 0, 1, 1, 1, 1, 0, 1] : 0,
			[1, 0, 0, 1, 1, 1, 0, 1, 0] : 0,
			[0, 0, 0, 1, 1, 1, 0, 0, 1] : 0,
			[1, 1, 0, 0, 1, 0, 0, 1, 0] : 0,
			[1, 0, 1, 0, 1, 0, 1, 0, 0] : 0,
			[0, 1, 1, 1, 1, 1, 0, 1, 1] : 0,
		},
		
		"FlatSurface1" = {
			[1, 1, 1, 1, 1, 1, 1, 1, 1] : 0,
			[0, 1, 0, 1, 1, 1, 0, 1, 0] : 0,
			
		},
		"DiagonalSurface" = {
			[1, 0, 1, 0, 1, 0, 0, 1, 1] : 16,
			[1, 0, 1, 1, 1, 0, 1, 0, 1] : 0,
			[1, 0, 1, 0, 1, 0, 0, 1, 0] : 16,
			[1, 1, 1, 0, 1, 0, 1, 0, 1] : 22,
			[1, 0, 1, 0, 1, 1, 0, 0, 1] : 10,
			[1, 0, 0, 1, 1, 0, 0, 0, 1] : 0,
			[1, 0, 1, 0, 1, 0, 1, 1, 1] : 16,
			[0, 0, 1, 0, 1, 0, 1, 1, 0] : 16,
			[0, 0, 1, 1, 1, 0, 1, 0, 1] : 0,
			[0, 1, 1, 0, 1, 0, 1, 0, 0] : 22,
			[0, 0, 1, 1, 1, 0, 0, 0, 1] : 0,
			[1, 1, 1, 0, 1, 0, 1, 0, 0] : 22,
			[1, 0, 0, 0, 1, 1, 1, 0, 0] : 10,
			[0, 0, 1, 0, 1, 1, 1, 0, 1] : 10,
			[0, 1, 0, 0, 1, 0, 1, 0, 1] : 22,
			[1, 0, 1, 0, 1, 1, 1, 0, 1] : 10,
			[1, 0, 0, 1, 1, 0, 1, 0, 1] : 0,
			[1, 0, 0, 0, 1, 0, 0, 1, 1] : 16,
			[1, 1, 1, 0, 1, 1, 1, 1, 1] : 10,
			[0, 0, 1, 0, 1, 0, 1, 1, 1] : 16,
			[1, 1, 1, 1, 1, 1, 1, 0, 1] : 22,
			[0, 0, 1, 1, 1, 0, 0, 0, 0] : 0,
			[0, 1, 0, 0, 1, 0, 1, 0, 0] : 22,
			[1, 1, 0, 0, 1, 0, 1, 0, 1] : 22,
			[1, 1, 0, 0, 1, 0, 0, 0, 1] : 22,
			[0, 0, 0, 1, 1, 0, 1, 0, 1] : 0,
			[0, 1, 1, 0, 1, 1, 0, 1, 1] : 10,
			[0, 0, 0, 0, 1, 1, 1, 0, 1] : 10,
			[1, 0, 1, 0, 1, 1, 0, 0, 0] : 10,
			[1, 0, 1, 1, 1, 0, 0, 0, 0] : 0,
			[0, 0, 0, 1, 1, 1, 1, 1, 1] : 16,
			[0, 0, 1, 0, 1, 1, 1, 0, 0] : 10,
			[1, 1, 1, 1, 1, 1, 0, 0, 0] : 22,
			[1, 0, 0, 0, 1, 1, 1, 0, 1] : 10,
			[1, 1, 0, 1, 1, 0, 1, 1, 0] : 0,
			[1, 1, 1, 0, 1, 0, 0, 0, 1] : 22,
			[1, 1, 1, 1, 1, 1, 0, 0, 1] : 22,
			[1, 1, 0, 0, 1, 0, 0, 0, 0] : 22,
			[1, 0, 1, 1, 1, 1, 1, 1, 1] : 16,
			[1, 0, 0, 1, 1, 0, 0, 0, 0] : 0,
			[1, 1, 0, 1, 1, 0, 1, 1, 1] : 0,
			[0, 0, 1, 1, 1, 0, 1, 0, 0] : 0,
			[1, 0, 0, 1, 1, 0, 1, 0, 0] : 0,
			[1, 1, 1, 0, 1, 0, 0, 0, 0] : 22,
			[0, 0, 0, 0, 1, 0, 0, 1, 0] : 16,
			[0, 1, 0, 0, 1, 0, 0, 0, 0] : 22,
			[0, 0, 0, 0, 1, 0, 1, 1, 1] : 16,
			[0, 0, 1, 0, 1, 1, 0, 0, 1] : 10,
			[1, 1, 1, 1, 1, 1, 1, 0, 0] : 22,
			[1, 1, 1, 1, 1, 0, 1, 1, 0] : 0,
			[0, 0, 1, 1, 1, 1, 1, 1, 1] : 16,
			[0, 1, 1, 0, 1, 1, 1, 1, 1] : 10,
			[1, 1, 1, 0, 1, 1, 0, 1, 1] : 10,
			[1, 0, 0, 1, 1, 1, 1, 1, 1] : 16,
			[0, 0, 0, 0, 1, 1, 0, 0, 0] : 10,
			[0, 0, 0, 1, 1, 0, 0, 0, 0] : 0,
			[0, 0, 0, 0, 1, 0, 0, 1, 1] : 16,
			[0, 1, 1, 0, 1, 0, 0, 0, 0] : 22,
			[0, 0, 0, 1, 1, 0, 1, 0, 0] : 0,
			[0, 0, 1, 0, 1, 1, 0, 0, 0] : 10,
			[0, 0, 0, 0, 1, 0, 1, 1, 0] : 16,
			[0, 0, 0, 0, 1, 1, 0, 0, 1] : 10,
			[0, 0, 0, 0, 1, 1, 1, 0, 0] : 10,
			[1, 0, 0, 0, 1, 0, 0, 1, 0] : 16,
			[0, 0, 0, 1, 1, 0, 0, 0, 1] : 0,
			[0, 1, 0, 0, 1, 0, 0, 0, 1] : 22,
			[1, 0, 0, 0, 1, 1, 0, 0, 0] : 10,
			[1, 0, 0, 0, 1, 1, 0, 0, 1] : 10,
			[1, 0, 1, 1, 1, 0, 0, 0, 1] : 0,
			[1, 0, 0, 0, 1, 0, 1, 1, 0] : 16,
			[0, 0, 1, 0, 1, 0, 0, 1, 1] : 16,
			[0, 0, 1, 1, 1, 0, 0, 1, 1] : 0,
			[0, 1, 1, 0, 1, 0, 0, 0, 1] : 22,
			[1, 0, 1, 1, 1, 0, 1, 0, 0] : 0,
			[1, 1, 0, 0, 1, 0, 1, 0, 0] : 22,
			[1, 1, 1, 1, 1, 0, 1, 1, 1] : 0,
			[1, 0, 1, 0, 1, 1, 1, 0, 0] : 10,
			[1, 0, 0, 0, 1, 0, 1, 1, 1] : 16,
			[1, 0, 1, 0, 1, 0, 1, 1, 0] : 16,
			[0, 1, 1, 0, 1, 0, 1, 0, 1] : 22,
			[0, 0, 1, 0, 1, 0, 0, 1, 0] : 16
		},
		"DiagonalOutCornerSurface" = {
			[0, 0, 1, 0, 1, 1, 1, 1, 1] : 10,
			[0, 0, 1, 0, 1, 1, 0, 1, 1] : 10,
			[0, 0, 1, 1, 1, 0, 1, 1, 0] : 16,
			[0, 0, 0, 1, 1, 0, 1, 1, 1] : 16,
			[1, 0, 0, 0, 1, 1, 1, 1, 1] : 10,
			[0, 1, 1, 0, 1, 1, 1, 0, 1] : 22,
			[1, 1, 1, 1, 1, 0, 0, 0, 1] : 0,
			[1, 1, 0, 1, 1, 0, 0, 0, 1] : 0,
			[1, 0, 0, 0, 1, 1, 0, 1, 1] : 10,
			[1, 0, 1, 0, 1, 1, 1, 1, 1] : 10,
			[0, 0, 1, 1, 1, 0, 1, 1, 1] : 16,
			[1, 1, 1, 1, 1, 0, 1, 0, 1] : 0,
			[1, 1, 1, 0, 1, 1, 1, 0, 1] : 22,
			[1, 0, 1, 1, 1, 0, 1, 1, 1] : 16,
			[1, 1, 1, 1, 1, 0, 1, 0, 0] : 0,
			[0, 0, 0, 0, 1, 1, 0, 1, 1] : 10,
			[0, 1, 1, 0, 1, 1, 0, 0, 0] : 22,
			[0, 0, 0, 1, 1, 0, 1, 1, 0] : 16,
			[1, 1, 0, 1, 1, 0, 0, 0, 0] : 0,
			[1, 0, 0, 1, 1, 0, 1, 1, 1] : 16,
			[0, 0, 0, 0, 1, 1, 1, 1, 1] : 10,
			[1, 0, 0, 1, 1, 0, 1, 1, 0] : 16,
			[0, 1, 1, 0, 1, 1, 0, 0, 1] : 22,
			[1, 1, 1, 1, 1, 0, 0, 0, 0] : 0,
			[1, 1, 0, 1, 1, 0, 1, 0, 1] : 0,
			[1, 1, 0, 1, 1, 0, 1, 0, 0] : 0,
			[1, 0, 1, 1, 1, 0, 1, 1, 0] : 16,
			[1, 1, 1, 0, 1, 1, 0, 0, 1] : 22,
			[1, 1, 1, 0, 1, 1, 0, 0, 0] : 22,
			[1, 1, 1, 0, 1, 1, 1, 0, 0] : 22,
			[0, 1, 1, 0, 1, 1, 1, 0, 0] : 22,
			[1, 0, 1, 0, 1, 1, 0, 1, 1] : 10
			
		},
		"DiagonalPshapeFlip" = {
			[1, 1, 0, 1, 1, 0, 0, 1, 0] : 0,
			[0, 1, 0, 0, 1, 1, 1, 1, 1] : 10,
			[0, 1, 0, 0, 1, 1, 0, 1, 1] : 10,
			[1, 1, 0, 1, 1, 0, 0, 1, 1] : 0,
			[0, 1, 1, 1, 1, 1, 1, 0, 1] : 22,
			[1, 1, 1, 1, 1, 0, 0, 1, 0] : 0,
			[0, 1, 1, 1, 1, 1, 0, 0, 1] : 22,
			[0, 1, 1, 1, 1, 1, 0, 0, 0] : 22,
			[1, 0, 0, 1, 1, 1, 1, 1, 0] : 16,
			[1, 1, 1, 1, 1, 0, 0, 1, 1] : 0,
			[1, 0, 1, 1, 1, 1, 1, 1, 0] : 16,
			[0, 1, 1, 1, 1, 1, 1, 0, 0] : 22,
			[0, 0, 0, 1, 1, 1, 1, 1, 0] : 16,
			[1, 1, 0, 0, 1, 1, 0, 1, 1] : 10,
			[1, 1, 0, 0, 1, 1, 1, 1, 1] : 10,
			[0, 0, 1, 1, 1, 1, 1, 1, 0] : 16,
			
		},
		"DiagonalPShape" = {
			[1, 1, 0, 1, 1, 1, 0, 0, 0] : 0,
			[0, 0, 1, 1, 1, 1, 0, 1, 1] : 10,
			[0, 0, 0, 1, 1, 1, 0, 1, 1] : 10,
			[0, 1, 1, 1, 1, 0, 1, 1, 0] : 16,
			[1, 1, 1, 0, 1, 1, 0, 1, 0] : 22,
			[0, 1, 1, 0, 1, 1, 0, 1, 0] : 22,
			[1, 1, 1, 0, 1, 1, 1, 1, 0] : 22,
			[1, 1, 0, 1, 1, 1, 0, 0, 1] : 0,
			[1, 1, 0, 1, 1, 1, 1, 0, 0] : 0,
			[1, 0, 0, 1, 1, 1, 0, 1, 1] : 10,
			[1, 0, 1, 1, 1, 1, 0, 1, 1] : 10,
			[0, 1, 1, 1, 1, 0, 1, 1, 1] : 16,
			[0, 1, 1, 0, 1, 1, 1, 1, 0] : 22,
			[0, 1, 0, 1, 1, 0, 1, 1, 0] : 16,
			[0, 1, 0, 1, 1, 0, 1, 1, 1] : 16,
			[1, 1, 0, 1, 1, 1, 1, 0, 1] : 0,
		},
		"DiagonalFIshShape" = {
			[1, 1, 0, 1, 1, 1, 0, 1, 0] : 16,
			[0, 1, 0, 1, 1, 1, 1, 1, 0] : 10,
			[0, 1, 1, 1, 1, 1, 0, 1, 0] : 0,
			[0, 1, 0, 1, 1, 1, 0, 1, 1] : 22,
			
		},
		"DiagonalInCornerSurface" = {
			[1, 1, 1, 1, 1, 1, 1, 1, 0] : 0,
			[0, 0, 1, 1, 1, 0, 0, 1, 0] : 16,
			[1, 0, 0, 0, 1, 1, 1, 1, 0] : 10,
			[1, 1, 0, 0, 1, 1, 0, 0, 0] : 22,
			[0, 1, 0, 0, 1, 1, 0, 0, 1] : 22,
			[1, 1, 0, 0, 1, 1, 0, 0, 1] : 22,
			[1, 0, 0, 1, 1, 0, 0, 1, 1] : 16,
			[0, 1, 1, 1, 1, 1, 1, 1, 1] : 10,
			[0, 0, 0, 0, 1, 1, 1, 1, 0] : 10,
			[1, 1, 1, 1, 1, 1, 0, 1, 1] : 22,
			[1, 1, 0, 1, 1, 1, 1, 1, 1] : 16,
			[1, 0, 1, 0, 1, 1, 1, 1, 0] : 10,
			[0, 0, 1, 0, 1, 1, 1, 1, 0] : 10,
			[0, 1, 1, 1, 1, 0, 1, 0, 1] : 0,
			[0, 0, 1, 0, 1, 1, 0, 1, 0] : 10,
			[0, 1, 0, 0, 1, 1, 0, 0, 0] : 22,
			[0, 1, 1, 1, 1, 0, 0, 0, 0] : 0,
			[0, 1, 0, 1, 1, 0, 0, 0, 0] : 0,
			[0, 0, 0, 0, 1, 1, 0, 1, 0] : 10,
			[0, 1, 0, 1, 1, 0, 0, 0, 1] : 0,
			[0, 0, 0, 1, 1, 0, 0, 1, 0] : 16,
			[1, 0, 0, 0, 1, 1, 0, 1, 0] : 10,
			[0, 1, 0, 1, 1, 0, 1, 0, 0] : 0,
			[0, 1, 1, 1, 1, 0, 0, 0, 1] : 0,
			[0, 1, 1, 1, 1, 0, 1, 0, 0] : 0,
			[1, 0, 0, 1, 1, 0, 0, 1, 0] : 16,
			[1, 1, 0, 0, 1, 1, 1, 0, 0] : 22,
			[0, 1, 0, 0, 1, 1, 1, 0, 1] : 22,
			[0, 0, 0, 1, 1, 0, 0, 1, 1] : 16,
			[1, 1, 0, 0, 1, 1, 1, 0, 1] : 22,
			[0, 1, 0, 0, 1, 1, 1, 0, 0] : 22,
			[1, 0, 1, 0, 1, 1, 0, 1, 0] : 10,
			[0, 1, 0, 1, 1, 0, 1, 0, 1] : 0,
			[1, 0, 1, 1, 1, 0, 0, 1, 1] : 16,
			[1, 0, 1, 1, 1, 0, 0, 1, 0] : 16,
		},
		"DoubleCorner" = {
			[1, 1, 0, 1, 1, 1, 0, 1, 1] : 10,
			[0, 1, 1, 1, 1, 1, 1, 1, 0] : 22,
		}
	}
	print(mesh_library.get_item_name(0))
	print(PosibilityDIctinary.keys())
	
	for id in terrain.mesh_library.get_item_list():
		terrainItemList.append(terrain.mesh_library.get_item_name(id))
	print(terrainItemList)
#	terrainItemList.find("FlatSurface0")
	print(terrainItemList.find("FlatSurface0"))
#	for x in range(-6,6):
#		for z in range(-6,6): 
#			var my_random_number = rng.randi_range(0, 1)
#			if my_random_number == 1 :
#				set_cell_item(Vector3(x,-1,z),1,0)

	for cell in terrain.get_used_cells() :
		terrain.set_cell_item(cell, INVALID_CELL_ITEM, 0)
	for cell in get_used_cells() :
		set_cell_item(cell, INVALID_CELL_ITEM, 0)
	var noise = FastNoiseLite.new()
	noise.seed = rng.randi_range(1,1000)
	noise.noise_type = FastNoiseLite.TYPE_SIMPLEX_SMOOTH
#	noise.frequency = 0.1
	var count = 10
	var yStair = sizex/count
	for x in range(int(0-(sizex/2)),int(0+(sizex/2))):
		for z in range(int(0-(sizez/2)),int(0+(sizez/2))):
			var y = clampi(int((noise.get_noise_2d(x,z))*20),-4,10)+yStair
			for yi in range(y,-7, -1):
				set_cell_item(Vector3(x,yi,z),1,0)
#			print(yStair)
		if count > 0 : 
			count = count - 1
		else :
			count = 10
			yStair = yStair - 1
	##Sungai Generator
	count = 10
	yStair = sizex/count
	var zRiverCenter= rng.randi_range(int(0-(sizex/4)),int(0+(sizex/4)))
	var lowestYRiver = clampi(int((noise.get_noise_2d(int(0-(sizex/2)),zRiverCenter))*20),-4,10)+yStair
	for x in range(int(0-(sizex/2)),int(0+(sizex/2))):
		zRiverCenter = rng.randi_range(zRiverCenter-1 , zRiverCenter+1)
		for z in range(zRiverCenter-rng.randi_range(2,4) , zRiverCenter+rng.randi_range(2,4)):
			var y = clampi(int((noise.get_noise_2d(x,z))*20),-4,10)+yStair
			if lowestYRiver > y :
				lowestYRiver = y
			for yi in range(y, lowestYRiver-3, -1):
				set_cell_item(Vector3(x,yi,z),-1,0)
		if count >= 0 : 
			count = count - 1
		else :
			count = 10
			yStair = yStair - 1
#	for y in range(5, -2, -1):
##		var randomJarak = rng.randi_range(0, 32)
#		for x in range(-62, 62, 1 if y < 1 else y*rng.randi_range(3, 7)):
#			for z in range(-62, 62, 1 if y < 1 else y*rng.randi_range(3, 7)): 
#				var my_random_number = rng.randi_range(0, 1)
#				if my_random_number == 1 :
#					for xi in range(x,x+rng.randi_range(1, 6)):
#						for zi in range(z,z+rng.randi_range(1, 6)):
#							for yi in range(y, -2, -1):
#
#								set_cell_item(Vector3(xi,yi,zi),1,0)
#	for x in range(-62,62):
#		for  z in range(-62,62):
#			set_cell_item(Vector3(x,-2,z),1,0)
#	for x in range(0,2):
#		for  z in range(0,2):
#			set_cell_item(Vector3(x,-1,z),1,0)
	
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
#		print(cellProbability)
#		print(true)
		setCell(cell, cellProbability, true if get_cell_item(Vector3(cell.x, cell.y+1, cell.z)) == INVALID_CELL_ITEM else false)
		

	pass # Replace with function body.

func setCell(position, CellPosibility, isSurface):
	var theCellId = null
	var theCellRotation = 0
	for key in PosibilityDIctinary:
		if PosibilityDIctinary[key].has(CellPosibility):
			theCellId = key;
			theCellRotation = PosibilityDIctinary[key][CellPosibility]
#			print(theCellRotation)
	if isSurface:
		if theCellId != null:
			terrain.set_cell_item(position,terrainItemList.find(theCellId),theCellRotation)
	else:
		terrain.set_cell_item(position,terrainItemList.find("Cube_013"),0)
#	print(terrain.get_cell_item(position))
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if update:
		_ready()
		update = false
#	print(get_used_cells())
	pass
