extends Control

@onready var level130: Panel = $"Achievement list/Level1/Level 1 label/level130"
@onready var level160: Panel = $"Achievement list/Level1/Level 1 label/level160"
@onready var level1120: Panel = $"Achievement list/Level1/Level 1 label/level1120"
@onready var level230: Panel = $"Achievement list/Level2/Level 2 label/level240"
@onready var level260: Panel = $"Achievement list/Level2/Level 2 label/level280"
@onready var level2120: Panel = $"Achievement list/Level2/Level 2 label/level2120"
@onready var level350: Panel = $"Achievement list/Level3/Level 3 label/level350"
@onready var level3100: Panel = $"Achievement list/Level3/Level 3 label/level3100"
@onready var level3150: Panel = $"Achievement list/Level3/Level 3 label/level3150"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var t1 := Level_1.winning_time
	var t2 := Level_2.winning_time
	var t3 := Level_3.winning_time
	if t1 > 0:
		level130.visible = t1 <= 30
		level160.visible = t1 <= 60
		level1120.visible = t1 <= 120
	if t2 > 0:
		level230.visible = t2 <= 40
		level260.visible = t2 <= 80
		level2120.visible = t2 <= 120
	if t3 > 0:
		level350.visible = t3 <= 50
		level3100.visible = t3 <= 100
		level3150.visible = t3 <= 150



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")
