extends Node

@export var back_ground_tilemap_layer : TileMapLayer

const WIDTH := 17
const HEIGHT := 17

var light_green_atlas := Vector2i(0, 0)
var dark_green_atlas = Vector2i(1, 0)

func _ready() -> void:
	set_play_area()

func set_play_area():
	for x in range(WIDTH):
		for y in range(HEIGHT):
			if (x + y) % 2:
				back_ground_tilemap_layer.set_cell(Vector2i(x, y), 0, dark_green_atlas)
			else:
				back_ground_tilemap_layer.set_cell(Vector2i(x, y), 0, light_green_atlas)



	
