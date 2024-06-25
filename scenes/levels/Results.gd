extends "res://scenes/levels/Base.gd"

@onready var next_btn: Button = $NextBtn
@onready var prev_btn: Button = $PrevBtn

func _ready():
	super._ready()
	next_btn.text = "Main Menu"
	prev_btn.text = "Quit"

func _on_next_btn_pressed():
	GameManager.load_main_menu()

func _on_prev_btn_pressed():
	GameManager.quit()
