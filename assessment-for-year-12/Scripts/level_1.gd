extends Node2D

@onready var settings: Panel = $Settings
@onready var player: Player = $Player

func _on_back_to_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")


func _on_elevator_body_entered(body: Node2D) -> void:
	if player.battery_count >= 8:
		print("you won")
		get_tree().change_scene_to_file("res://Scenes/win_menu.tscn")
