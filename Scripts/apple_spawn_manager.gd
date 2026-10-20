extends Node


@export var apple_tilemap_layer : TileMapLayer

var apple_atlas := Vector2i (2, 0)
var spawn_pos := Vector2i.ZERO
func _ready() -> void:
	spawn_apple()

func spawn_apple():
	var x : int = randi_range(0, 16)
	var y : int = randi_range(0, 16)

	spawn_pos = Vector2i(x, y)

	print (spawn_pos)

	apple_tilemap_layer.set_cell(spawn_pos, 0, apple_atlas)
