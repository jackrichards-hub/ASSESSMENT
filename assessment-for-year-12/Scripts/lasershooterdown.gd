extends Node2D

#This code is the same as lasershooter but the direction is down as I was unsure how to do it all in one script

var laser_prefab = preload("res://Sprites/laser.tscn")

var num_bullets = 1

func _on_timer_timeout() -> void:
	#call the spawn laser
	shoot()
	
	
func spawn_laser(direction : Vector2):
	#spawn a laser
	var laser = laser_prefab.instantiate()
	#Taken from snowman survivor code may be unimportant
	laser.position = global_position
	laser.direction = direction
	#added under a group so it can easily be queued_free when the player respawns
	laser.add_to_group("lasers")
	#Adds it purely to the current scene so when changed the laser doesn't keep going
	get_tree().current_scene.add_child(laser)
	
func shoot():
	var direction = Vector2.DOWN
	for i in range(num_bullets):
		#spawn a bullet
		spawn_laser(direction)
