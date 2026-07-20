extends Node2D

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")


func _on_elevator_body_entered(body: Node2D) -> void:
	if Player and body.battery_count >= 8:
		print("you won")
		get_tree().change_scene_to_file("res://Scenes/win_menu.tscn")
