extends Node

@onready var level_select_packed_scene: PackedScene = preload("res://scenes/LevelSelect.tscn")

var current_level_index = 0
var total_game_time: float = 0.0
var timer_wait_time: float = 0.01
var is_complete = false
var timer: Timer
var final_time: float = 0.0

@onready var main_menu_packed_scene = preload("res://scenes/MainMenu.tscn")
@onready var results_packed_scene = preload("res://scenes/Results.tscn")

@onready var levels = [
	"res://resources/RightLevel.tres",
	"res://resources/TopLevel.tres",
	"res://resources/MultiballLevel.tres",
	"res://resources/MirrorLevel.tres",
	"res://resources/Boss.tres",
]

func _ready():
	load_main_menu()
	setup_timer()
	
func setup_timer():
	timer = Timer.new()
	timer.wait_time = timer_wait_time
	timer.timeout.connect(_on_timer_timeout)
	self.add_child(timer)
	
func start_game():
	current_level_index = 0
	load_level()
	timer.start()

func _on_timer_timeout():
	total_game_time = (round(total_game_time * 100.0) / 100.0) + timer_wait_time 

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
	else:
		is_complete = true
		load_results()
	
func load_prev_level():
	var prev_level_index = current_level_index - 1
	if prev_level_index >= 0:
		load_level(prev_level_index)
		
func load_results():
	timer.stop()
	final_time = total_game_time
	total_game_time = 0.0
	
	get_tree().change_scene_to_packed(results_packed_scene)
		
func load_level_select():
	get_tree().change_scene_to_packed(level_select_packed_scene)

func quit():
	get_tree().quit()
