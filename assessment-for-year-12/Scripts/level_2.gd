extends Node2D
class_name Level_2

@onready var player: Player = $Player

#winning_time is a variable for the achievements, float is used so that it can have decimals and be called by godot easier
static var winning_time: float = 0.0

func _on_back_to_main_menu_pressed() -> void:
	#Resets the time so that when the level is rejoined or changed to another it will be reset to 0
	#The class name is used to make it accessed across scripts easier
	GameTimer.total_time_in_secs = 0
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")

func _on_elevator_body_entered(body: Node2D) -> void:
	if player.battery_count >= 10:
		print("you won")
		#This differentiates the different levels to ensure that the achievements can be separated and isn't connected to a single winning time
		Level_2.winning_time = GameTimer.total_time_in_secs
		#resets the total time but GameTimer is used to connect it to the gametimer script
		GameTimer.total_time_in_secs = 0
		get_tree().change_scene_to_file("res://Scenes/win_menu.tscn")
