extends Node


@export var apple_tilemap_layer : TileMapLayer
@export var snake_script : Snake

var apple_atlas := Vector2i (2, 0)
var spawn_pos := Vector2i.ZERO

func _ready() -> void:
	spawn_apple()

func spawn_apple():
	var x : int
	var y : int

	# Keep looping until we find a position NOT on the snake
	while true:
		x = randi_range(0, 16)
		y = randi_range(0, 16)
		spawn_pos = Vector2i(x, y)		
		var on_snake = false
		for body in snake_script.snake_position_list:
			if body == spawn_pos:
				on_snake = true
				break  
		if not on_snake:
			break	
	print("Apple spawned at: ", spawn_pos)
	apple_tilemap_layer.set_cell(spawn_pos, 0, apple_atlas)

func _on_snake_manager_apple_eaten() -> void:
	#print("hi im from apple script")
	apple_tilemap_layer.clear()
	spawn_apple()
