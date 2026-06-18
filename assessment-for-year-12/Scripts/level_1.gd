extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")


func _on_elevator_body_entered(body: Node2D) -> void:
	if body is Player and body.battery_count >= 8:
		print("you won")
		get_tree().change_scene_to_file("res://Scenes/level_menu.tscn")
