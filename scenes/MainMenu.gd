extends Node2D

func _on_play_btn_pressed():
	GameManager.load_level(0)

func _on_quit_btn_pressed():
	GameManager.quit()
