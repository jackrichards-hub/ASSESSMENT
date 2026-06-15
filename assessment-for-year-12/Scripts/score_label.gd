extends Label


func _on_player_scored(score : int) -> void:
	text = "Batteries: "+ str(Battery)
