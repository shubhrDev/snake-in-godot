extends Node

@onready var score_text: Label = $'../Score Menu/score'

var score : int = 0

func increase_score():
	score += 1
	score_text.text = str(score)
func _on_snake_manager_apple_eaten() -> void:
	increase_score()


func _on_button_button_down() -> void:
	Engine.time_scale = 1
	get_tree().reload_current_scene()
