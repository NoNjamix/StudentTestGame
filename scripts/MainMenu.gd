extends Control

@export var info : Control

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/QuizGame.tscn")

func _on_info_button_pressed() -> void:
	get_tree().paused = true
	info.visible = true
