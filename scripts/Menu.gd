extends Control

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _on_cancel_button_pressed() -> void:
	self.visible = false
	get_tree().paused = false

func _on_exit_button_pressed() -> void:
	self.visible = false
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/MainMenu.tscn")
