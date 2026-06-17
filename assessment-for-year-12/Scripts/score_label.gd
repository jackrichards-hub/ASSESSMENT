extends Label



func _on_player_collected(count: Variant) -> void:
	text = "Batteries: "+ str(count)
