extends Area2D




func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		print ("you won")
		#load a new level
		get_tree().change_scene_to_file("res://Scenes/level_menu.tscn")
		pass
