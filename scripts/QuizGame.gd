extends Control

@export var active_questions: Array[QuestionData]
@export var question_label : Label
@export var answer_buttons : Array[Button]
@export var back_button : Button
@export var forward_button : Button
@export var progress_bar : ProgressBar
@export var menu : Control
@export var result : Control

var index: int = 0
var answered: Dictionary = {}

func _ready() -> void:
	active_questions.shuffle()
	
	load_current_question()
	
func _process(delta: float) -> void:
	var target_value = float(answered.size()) / float(active_questions.size()) * 100
	progress_bar.value = lerp(progress_bar.value, target_value, delta * 10)

func load_current_question() -> void:
	var question : QuestionData = active_questions[index]
	question_label.text = question.question_text
	
	back_button.disabled = (index == 0)
	forward_button.disabled = (index == active_questions.size() - 1) and (answered.size() != 5)
	
	if index == active_questions.size() - 1:
		if answered.size() == active_questions.size():
			forward_button.disabled = false
			forward_button.text = "завершить"
			forward_button.pressed.disconnect(_on_next_button_pressed)
			forward_button.pressed.connect(_on_finish_button_pressed)
	
	for i in range(question.answers.size()):
		var button = answer_buttons[i]
		button.text = question.answers[i].text
		
		if button.pressed.is_connected(_on_answer_button_pressed):
			button.pressed.disconnect(_on_answer_button_pressed)
		
		if answered.has(question.question_text) and answered[question.question_text] == question.answers[i]:
			button.button_pressed = true #modulate = Color("e31f21")
		else:
			button.button_pressed = false #Color("f3e9dd")
		
		button.pressed.connect(_on_answer_button_pressed.bind(question.question_text, question.answers[i]))

func _on_answer_button_pressed(question_text, button_obj):
	answered[question_text] = button_obj
	load_current_question()

func _on_back_button_pressed():
	index -= 1
	load_current_question()

func _on_next_button_pressed():
	index += 1
	load_current_question()

func _on_menu_button_pressed() -> void:
	menu.visible = true
	get_tree().paused = true

func _on_finish_button_pressed():
	result.visible = true
	get_tree().paused = true
	result.load_result(answered)
