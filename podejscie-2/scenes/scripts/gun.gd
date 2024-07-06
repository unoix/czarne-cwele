extends Node2D

var can_shoot = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	look_at(get_global_mouse_position())
	if Input.is_action_just_pressed("shoot") && can_shoot:
		can_shoot = false
		$AnimatedSprite2D.play("default")
		await get_tree().create_timer(3/20).timeout
		shoot()
		$Cooldown.start()
		await get_tree().create_timer(3/20).timeout
		$Label.text = ""
		

func shoot():
	$Label.text = "Shot"
	var object = $Muzzle.get_collider()
	if object != null:
		object.queue_free()


	


func _on_cooldown_timeout():
	can_shoot = true
