class_name Player
extends CharacterBody2D

@onready var animation : AnimatedSprite2D = $AnimatedSprite2D
@onready var sprint_again_timer: Timer = $dash_cooldown
@onready var Progress_Dash_Cooldown_Bar: ProgressBar = $"UI/Visual Dash Cooldown"
@onready var jumpsound: AudioStreamPlayer2D = $jumpsound

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const DASH_SPEED = 900.0
const gravity = 120
#for wall jumping
const wall_jump_pushback = 400
const wall_slide_gravity = 200
var is_wall_sliding = false
#for dashing
var dashing = false
var can_dash = true
#for double jump (when jump_count reaches 2 double jump cannot go again)
var jump_count = 0
#for respawn
var start_position = Vector2(31,182)
var battery_count = 0
#for num of batteries on ui label
signal collected(count)
#for achievements
static var death_count = 0
static var secret_achievement = false

func _physics_process(delta: float) -> void:
	#This is for the dash cooldown progress bar, it is connected to a value from 0 min to 100 max
	#it is basically the rapidly decreasing time divided by the original time
	if $dash_cooldown.time_left > 0:
		Progress_Dash_Cooldown_Bar.value = ($dash_cooldown.time_left / $dash_cooldown.wait_time) * 100.0
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		jump_count = 0
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and jump_count < 2:
		jump_count +=1 
		velocity.y = JUMP_VELOCITY
		jumpsound.play()
		
	#This is for dash
	if Input.is_action_just_pressed("Sprint") and can_dash:
		dashing = true
		can_dash = false
		$dash_timer.start()
		
		#This is for jumping off walls
	if is_on_wall() and Input.is_action_just_pressed("ui_accept"):
			velocity.y = JUMP_VELOCITY
			velocity.x = -wall_jump_pushback
	if is_on_wall() and Input.is_action_just_pressed("ui_left"):
			velocity.y = JUMP_VELOCITY
			velocity.x = wall_jump_pushback
	if is_on_wall() and Input.is_action_just_pressed("ui_right"):
			velocity.y = JUMP_VELOCITY
			velocity.x = -wall_jump_pushback
	
	
		
	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		if dashing: 
			velocity.x = direction * DASH_SPEED
		else:
			velocity.x = direction * SPEED
		#flip_h if moving left
		if direction < 0.1:
			animation.flip_h = true
		else:
			animation.flip_h = false
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	wall_slide(delta)
	
	
	move_and_slide()
	if is_on_floor():
		if abs(velocity.x) > 0.1:
			animation.play("Run")
		else:
			animation.play("Idle")
	else: 
		animation.play("Jump")
	
#this is for wall sliding which causes the player to slide down the wall
#this is part of the wall jumping mechanics
func wall_slide(delta):
	if is_on_wall() and !is_on_floor():
		if Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right"):
			is_wall_sliding = true
		else: 
			is_wall_sliding = false
	else:
		is_wall_sliding = false
		
	if is_wall_sliding:
		velocity.y += (wall_slide_gravity * delta)
		velocity.y = min(velocity.y, wall_slide_gravity)

#this is for respawning which resets the battery and level and adds 1 to the deathcount which is for achievements
func respawn():
	position = start_position
	battery_count = 0
	collected.emit(battery_count)
	Player.death_count += 1
	print(death_count)
	#in the laser script it was added to a group so that the entire group can be queued free as opposed to each singular laser
	get_tree().call_group("lasers", "queue_free")
	get_tree().reload_current_scene()
	
#When the player spawns in make the progress dash cooldown bar invisible. 
func _ready() -> void:
	Progress_Dash_Cooldown_Bar.visible = false
	
#This stops the dash
func _on_dash_timer_timeout() -> void:
	#For when dashing stops a cooldown starts
	print("Dash ended")
	dashing = false
	$dash_cooldown.start()
	#This makes the player able to see the dash cooldown bar
	Progress_Dash_Cooldown_Bar.visible = true
	#Starts at 100 and counts down to 0 in a second
	#connected to the dash progress bar mechanics in the physics process at the top
	Progress_Dash_Cooldown_Bar.value = 100
	
	
#this is the cooldown between dashing
func _on_dash_cooldown_timeout() -> void:
	#for when the dashing cooldown ends the player can dash again
	can_dash = true
	#makes the progress bar for cooldown disappear as the player can dash again
	Progress_Dash_Cooldown_Bar.visible = false
	
#This is for the collecting of batteries
func _on_hitbox_area_entered(area: Area2D) -> void:
	if area is Battery:
		print("collected battery")
		battery_count += 1
		collected.emit(battery_count)
		print(battery_count)
		area.queue_free()
	#when laser hits player, player dies
	if area is Laser:
		respawn()
		

#Sends player back to main menu
func _on_back_to_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")
	

#For making acid vats kill player
func _on_acid_vat_body_entered(body: Node2D) -> void:
	if body is Player:
		respawn()

#This is for when secret battery is collected the secret achievement is unlocked
func _on_battery_area_entered(area: Area2D) -> void:
	Player.secret_achievement = true
