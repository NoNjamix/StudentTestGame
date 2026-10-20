extends Control

@export var label : Label
@export var picture : TextureRect

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func load_result(answered):
	var categories: Dictionary = {"engineer": [0, "ИНЖЕНЕР", "res://assets/engineer_label (1).png"],
	"sportsman": [0, "СПОРТСМЕН", "res://assets/sportsman_label (1).png"],
	"scientist": [0, "ИССЛЕДОВАТЕЛЬ", "res://assets/scientist_label (1).png"],
	"influencer": [0, "ОБЩЕСТВЕННЫЙ ДЕЯТЕЛЬ", "res://assets/influencer_label (1).png"],
	"artist": [0, "ТВОРЧЕСКИЙ ДЕЯТЕЛЬ", "res://assets/artist_label (1).png"],
	"discovery": [0, "ОТКРЫТИЕ", "res://assets/discovery_label (1).png"]}
	
	for answer in answered.values():
		(categories[answer.point])[0] += 1
	
	var max_count : int = -1
	var max_category = "abc"
	for category in categories.keys():
		if categories[category][0] > max_count:
			max_category = category
			max_count = categories[category][0]
	
	label.text = "ТЫ - " + categories[max_category][1] + " ГОДА!"
	picture.texture = load(categories[max_category][2])

func _on_button_pressed() -> void:
	get_tree().paused = false
	#get_tree().change_scene_to_file("res://scenes/MainMenu.tscn")
	get_tree().	call_deferred("change_scene_to_file", "res://scenes/MainMenu.tscn")
	get_tree().change_scene_to_file("res://scenes/MainMenu.tscn")
