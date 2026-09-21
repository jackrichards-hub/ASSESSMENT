extends Node2D

@onready var settings: Panel = $Settings

func _on_back_to_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")


func _on_elevator_body_entered(body: Node2D) -> void:
	if Player and body.battery_count >= 10:
		print("you won")
		get_tree().change_scene_to_file("res://Scenes/win_menu.tscn")
