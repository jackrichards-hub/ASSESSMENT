extends CharacterBody2D

@onready var animation : AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var start_position = Vector2(31,182)


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
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
		animation.play("jump")
	
	if position.y > 900:
		respawn()

func respawn():
	position = start_position
