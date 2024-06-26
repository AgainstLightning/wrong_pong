extends Node2D

func _ready():
	pass

func _on_play_btn_pressed():
	GameManager.load_level(0)

func _on_quit_btn_pressed():
	GameManager.quit()

func _on_level_select_btn_pressed():
	GameManager.load_level_select()
