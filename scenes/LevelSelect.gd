extends Node2D

@onready var grid_container = $UI/CenterContainer/GridContainer

func _ready():
	var levels = GameManager.levels
	for i in levels.size():
		var roman_numeral = convert_to_roman_numeral(i + 1)
		var level_button = Button.new()
		level_button.text = roman_numeral
		level_button.custom_minimum_size = Vector2(30, 30)
		level_button.pressed.connect(Callable(_on_level_btn_pressed).bind(i))
		grid_container.add_child(level_button)
		

func _on_return_btn_pressed():
	print("toggled")
	GameManager.load_main_menu()

func _on_level_btn_pressed(level_index):
	GameManager.load_level(level_index)

func convert_to_roman_numeral(number_to_convert):
	var conversion_table = {
		1: "I",
		2: "II",
		3: "III",
		4: "IV",
		5: "V",
		6: "VI",
		7: "VII",
		8: "VIII",
		9: "IX",
		10: "X"
	}
	return conversion_table[number_to_convert]
