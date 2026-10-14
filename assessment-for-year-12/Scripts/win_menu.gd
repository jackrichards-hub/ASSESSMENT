extends Control


#this is the winning menu when you have entered an elevator


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level_menu.tscn")
