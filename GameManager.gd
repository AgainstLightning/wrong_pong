extends Node

var current_level_index = 0

@onready var levels = [
	"res://resources/RightLevel.tres",
	"res://resources/TopLevel.tres",
	"res://resources/MultiballLevel.tres",
	"res://resources/MirrorLevel.tres",
	"res://resources/Boss.tres"
]

func _ready():
	load_level(current_level_index)

func load_level(level_index):
	var level_data = load(levels[level_index])
	get_tree().change_scene_to_packed(level_data["scene"])
	current_level_index = level_index

func load_next_level():
	var next_level_index = current_level_index + 1
	load_level(next_level_index)
