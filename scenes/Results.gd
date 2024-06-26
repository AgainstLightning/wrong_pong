extends Node2D

@onready var time = $UI/Time
@onready var menu_btn = $UI/MenuBtn
@onready var quit_btn = $UI/QuitBtn

func _ready():
	time.text = "[center]" + str(GameManager.final_time)

func _on_menu_btn_pressed():
	GameManager.load_main_menu()

func _on_quit_btn_pressed():
	GameManager.quit()
