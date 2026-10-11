extends Area2D
class_name Laser
@onready var Player = $player

var speed = 600
var direction : Vector2 = Vector2.RIGHT



func _process(delta: float) -> void:
	translate(direction * speed * delta)
