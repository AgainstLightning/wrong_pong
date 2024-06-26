extends Node2D

@onready var display_name_text = $DisplayNameText
@onready var subtitle_text = $SubtitleText
@onready var timer_text = $TimerText

func _ready():
	var level_data: LevelData = load(GameManager.levels[GameManager.current_level_index])
	display_name_text.text = "[center]" + level_data.display_name
	subtitle_text.text = "[center]" + level_data.subtitle
	
func _process(delta):
	if GameManager.total_game_time > 0.00:
		timer_text.show()
		timer_text.text = str(GameManager.total_game_time).pad_decimals(2)

func _on_next_btn_pressed():
	GameManager.load_next_level()

func _on_prev_btn_pressed():
	GameManager.load_prev_level()
