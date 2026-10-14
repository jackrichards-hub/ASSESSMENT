extends Control

@onready var main_buttons: VBoxContainer = $MainButtons
@onready var settings: Panel = $Settings
@onready var credits: Panel = $Credits



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#on opening of the game the main buttons can be seen but settings and credits cant. 
func _ready():
	main_buttons.visible = true
	credits.visible = false
	settings.visible = false

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level_menu.tscn")


func _on_achievements_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/achievements.tscn")

#When settings is pressed only the settings can be seen (and the background)
func _on_settings_pressed() -> void:
	main_buttons.visible = false
	settings.visible = true
	credits.visible = false

#When credits is pressed only the credits can be seen (and the background)
func _on_credits_pressed() -> void:
	main_buttons.visible = false
	settings.visible = false
	credits.visible = true

#ends the game
func _on_quit_pressed() -> void:
	get_tree().quit()

#this is when back to menu is pressed the settings disappear and returns to its original main buttons only
func _on_back_options_pressed() -> void:
	_ready()
