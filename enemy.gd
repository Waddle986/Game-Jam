extends CharacterBody2D # Or KinematicBody2D for Godot 3.x
@export var speed: float = -100.0

func _physics_process(delta):
	velocity.x = speed  # Move to the right
	move_and_slide()
