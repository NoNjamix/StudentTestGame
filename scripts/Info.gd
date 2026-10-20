extends Control

@export var exit_button : Button

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _on_exit_button_pressed() -> void:
	self.visible = false
	get_tree().paused = false
