extends Node

@export var op_scene: PackedScene
# Called when the node enters the scene tree for the first time.
func _ready():
	$Player.position = $StartPos.position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_opp_timer_timeout():
	$Path2D/PathFollow2D.progress_ratio = randf_range(0.0,1.0)
	var op = op_scene.instantiate()
	op.position = $Path2D/PathFollow2D.global_position
	get_tree().root.add_child(op)
