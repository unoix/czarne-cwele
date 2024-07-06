extends Node2D

@export var bullet_scene: PackedScene
@export var bullet_force = 100
var can_shoot = true
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	look_at(get_global_mouse_position())
	if Input.is_action_just_pressed("shoot") && can_shoot:
		can_shoot = false
		shoot()
		$Cooldown.start()

func shoot():
	var bullet =  bullet_scene.instantiate()
	$AnimatedSprite2D.play("default")
	await get_tree().create_timer(0.6).timeout	
	bullet.start($AnimatedSprite2D/Muzzle.global_position, rotation)
	get_tree().root.add_child(bullet)



func _on_cooldown_timeout():
	can_shoot = true
