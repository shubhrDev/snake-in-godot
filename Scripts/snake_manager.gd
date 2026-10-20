extends Node

@export var snake_layer : TileMapLayer
@export var snake_movement_duration : Timer


var snake_direction := Vector2i.RIGHT

var snake_color_atlas := Vector2i(3, 0)
var spawn_location := Vector2i(5, 8)

var snake_position_list := []
var previous_tail_position

var can_turn := true


func _ready() -> void:
	start_game()
func start_game():
	snake_position_list.clear()
	#Set positions up in list
	for i in range (0, 3):
		snake_position_list.append(spawn_location + Vector2i(-i, 0))
	
	for block in snake_position_list:
		draw_snake(block)
	
	
func _process(delta: float) -> void:
	handle_input()


func handle_input():
	if (!can_turn):
		return

	if Input.is_action_just_pressed("left") and snake_direction != Vector2i.RIGHT:
		snake_direction = Vector2i.LEFT
		can_turn = false
	elif Input.is_action_just_pressed("right") and snake_direction != Vector2i.LEFT:
		snake_direction = Vector2i.RIGHT
		can_turn = false
	elif Input.is_action_just_pressed("up") and snake_direction != Vector2i.DOWN:
		snake_direction = Vector2i.UP
		can_turn = false
	elif Input.is_action_just_pressed("down") and snake_direction != Vector2i.UP:
		snake_direction = Vector2i.DOWN
		can_turn = false

	if Input.is_action_just_pressed("ui_accept"):
		print("INCEASE SNAKE LENGHTH")
		grow_snake()
func draw_snake(pos):
	snake_layer.set_cell(pos, 0, snake_color_atlas)

func clear_snake(pos):
	snake_layer.set_cell(pos, -1)

func _on_timer_timeout() -> void:
	move_snake()

func move_snake():
	var previous_snake_positions := []
	
	for i in range (len (snake_position_list)):
		previous_snake_positions.append(snake_position_list[i])
	
	previous_tail_position = previous_snake_positions[-1]
	snake_position_list[0] += snake_direction

	for i in range (1, previous_snake_positions.size()):
		snake_position_list[i] = previous_snake_positions[i - 1]

	for block in previous_snake_positions:
		clear_snake(block)
		#print (block)
	for block in snake_position_list:
		draw_snake(block)

	can_turn = true

func grow_snake():
	snake_position_list.append(previous_tail_position)
