extends Control
class_name GameTimer
static var total_time_in_secs : int = 0

#When the player enters level timer starts
func _ready():
	$Timer.start()
	
#When timer timeouts one second is added to total time, timer runs for one second
func _on_timer_timeout() -> void:
	total_time_in_secs += 1
	#var min and sec make it so that when 60 seconds is reached timer goes to 1 minute then starts counting seconds again
	var min = int(total_time_in_secs / 60)
	var sec = total_time_in_secs - min * 60
	#connects it to the timer label that the player can see
	$Label.text = '%02d:%02d' % [min,sec]
