extends CharacterBody2D

@onready var animation : AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const SPRINT_SPEED = 900.0
var sprinting = false

var jump_count = 0
var start_position = Vector2(31,182)


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		jump_count = 0
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and jump_count < 2:
		jump_count +=1 
		velocity.y = JUMP_VELOCITY
	
	if Input.is_action_just_pressed("Sprint"):
		sprinting = true
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		if sprinting: 
			velocity.x = direction * SPRINT_SPEED
		else:
			velocity.x = direction * SPEED
		#flip_h if moving left
		if direction < 0.1:
			animation.flip_h = true
		else:
			animation.flip_h = false
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	
	
	move_and_slide()
	if is_on_floor():
		if abs(velocity.x) > 0.1:
			animation.play("Run")
		else:
			animation.play("Idle")
	else: 
		animation.play("Jump")
	
	if position.y > 900:
		respawn()

func respawn():
	position = start_position
