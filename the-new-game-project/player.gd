extends CharacterBody2D


const SPEED = 300.0
var JUMP_VELOCITY = -2000.0
var current_jump_vel = -2000
var falling = false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * 0.05

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		current_jump_vel += JUMP_VELOCITY * 0.005
		velocity.y = current_jump_vel
		

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


		
