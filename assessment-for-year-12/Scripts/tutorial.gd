extends Node2D
	



func _on_skip_tutorial_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level_menu.tscn")
