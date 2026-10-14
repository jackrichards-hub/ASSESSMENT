extends CheckButton



#makes it so that when the fullscreen button in settings is clicked the mode of viewing is changed 
#it can either be windowed or fullscreen
func _on_toggled(toggled_on: bool) -> void:
	if toggled_on == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
