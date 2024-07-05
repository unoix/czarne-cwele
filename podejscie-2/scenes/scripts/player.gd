extends CharacterBody2D

var gravity = ProjectSettings.get("physics/2d/default_gravity")
@export var WALK_SPEED = 100
@export var FRICTION = 3
@export var JUMP_HEIGHT = 50

func _physics_process(delta):
	velocity.y += gravity * delta
	
	if Input.is_action_pressed("move_left"):
		velocity.x = -WALK_SPEED
	elif Input.is_action_pressed("move_right"):
		velocity.x = WALK_SPEED
	elif velocity.x > 0 :
		velocity.x -= min(FRICTION,velocity.x)
	elif velocity.x < 0 :
		velocity.x += -max(-FRICTION,velocity.x)
	
	if Input.is_action_pressed("move_jump") && $RayCast2D.is_colliding():
		velocity.y -= JUMP_HEIGHT

	move_and_slide()
