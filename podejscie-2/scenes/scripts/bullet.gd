extends CharacterBody2D

@export var Speed = 1000

# Called when the node enters the scene tree for the first time.
func start(_position, _direction):
	rotation = _direction
	position = _position
	velocity = Vector2(Speed,0).rotated(rotation)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		queue_free()


func _on_timer_timeout():
	queue_free()
