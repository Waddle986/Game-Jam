extends CharacterBody2D

const speed = 200

func _physics_process(delta):
	velocity.x = -speed
	move_and_slide()
