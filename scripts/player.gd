extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("go_left", "go_right")
	# Move left
	if direction == -1:
		velocity.x = direction * SPEED
		animated_sprite.flip_h = true
		
	# Move right
	else:
		velocity.x = direction * SPEED
		animated_sprite.flip_h = false

	move_and_slide()
