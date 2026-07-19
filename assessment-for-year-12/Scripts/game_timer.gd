extends Control

var total_time_in_secs : int = 0

func _ready():
	$Timer.start()
	

func _on_timer_timeout() -> void:
	total_time_in_secs += 1
	var min = int(total_time_in_secs / 60)
	var sec = total_time_in_secs - min * 60
	$Label.text = '%02d:%02d' % [min,sec]
