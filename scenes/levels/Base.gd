extends Node2D

@onready var display_name_text = $DisplayNameText

func _ready():
	var level_data: LevelData = load(GameManager.levels[GameManager.current_level_index])
	print(level_data.display_name)
	display_name_text.text = level_data.display_name

func _on_next_button_pressed():
	GameManager.load_next_level()
