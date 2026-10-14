extends Label


#when a battery is collected it gets added to the score label for the ui on levels
func _on_player_collected(count: Variant) -> void:
	text = "Batteries: "+ str(count)
