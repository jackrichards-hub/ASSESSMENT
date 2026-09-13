extends Control

@onready var main_buttons: VBoxContainer = $MainButtons
@onready var settings: Panel = $Settings




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _ready():
	main_buttons.visible = true
	settings.visible = false

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level_menu.tscn")


func _on_achievements_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/achievements.tscn")


func _on_settings_pressed() -> void:
	main_buttons.visible = false
	settings.visible = true


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_back_options_pressed() -> void:
	_ready()
