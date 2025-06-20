extends CharacterBody2D

var score = 0
const SPEED = 300.0
const JUMP_VELOCITY = -525.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var fireball= preload("res://fireball.tscn")

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_shoot"):
		var fireball_temp = fireball.instantiate()
		fireball_temp.direction = 1
		add_child(fireball_temp)
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
