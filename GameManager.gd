extends Node

var current_level_index = 0

@onready var main_menu_packed_scene = preload("res://scenes/MainMenu.tscn")
@onready var levels = [
	"res://resources/RightLevel.tres",
	"res://resources/TopLevel.tres",
	"res://resources/MultiballLevel.tres",
	"res://resources/MirrorLevel.tres",
	"res://resources/Boss.tres",
	"res://resources/Results.tres"
]

func _ready():
	load_main_menu()
	
func load_main_menu():
	get_tree().change_scene_to_packed(main_menu_packed_scene)

func load_level(level_index = current_level_index):
	var level_data = load(levels[level_index])
	get_tree().change_scene_to_packed(level_data["scene"])
	current_level_index = level_index

func load_next_level():
	var next_level_index = current_level_index + 1
	if next_level_index < levels.size():
		load_level(next_level_index)
	
func load_prev_level():
	var prev_level_index = current_level_index - 1
	if prev_level_index > 0:
		load_level(prev_level_index)

func quit():
	get_tree().quit()
