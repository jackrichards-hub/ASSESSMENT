extends Control


func _on_tutorial_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/tutorial.tscn")

func _on_level_1_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level_1.tscn")


func _on_level_2_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level_2.tscn")
	
func _on_level_3_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level_3.tscn")
	

func _on_back_to_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")
