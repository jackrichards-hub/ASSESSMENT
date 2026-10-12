extends Node2D
class_name Level_3

@onready var player: Player = $Player

static var winning_time: float = 0.0

func _on_back_to_main_menu_pressed() -> void:
	GameTimer.total_time_in_secs = 0
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")


func _on_elevator_body_entered(body: Node2D) -> void:
	if player.battery_count >= 9:
		print("you won")
		Level_3.winning_time = GameTimer.total_time_in_secs
		GameTimer.total_time_in_secs = 0
		get_tree().change_scene_to_file("res://Scenes/win_menu.tscn")
