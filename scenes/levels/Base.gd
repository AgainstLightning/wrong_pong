extends Node2D

@onready var display_name_text = $DisplayNameText
@onready var subtitle_text = $SubtitleText

func _ready():
	var level_data: LevelData = load(GameManager.levels[GameManager.current_level_index])
	display_name_text.text = "[center]" + level_data.display_name
	subtitle_text.text = "[center]" + level_data.subtitle

func _on_next_btn_pressed():
	GameManager.load_next_level()

func _on_prev_btn_pressed():
	GameManager.load_prev_level()
