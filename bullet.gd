extends CharacterBody2D
class_name Bullet  # Це має бути на другому рядку, одразу після extends
var pos:Vector2
var speed = 300
var dir : float
var rota: float

func _ready():
	global_position = pos
	global_rotation = rota

	
func _physics_process(delta: float) -> void:
	velocity = Vector2(speed,0).rotated(dir)
	
	move_and_slide()
