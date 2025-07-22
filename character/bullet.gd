extends CharacterBody2D
class_name Bullet

var pos: Vector2
var speed := 250
var dir: float
var rota: float
var touch = 3


func _ready():
	global_position = pos
	global_rotation = rota
	velocity = Vector2(speed, 0).rotated(dir)

func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
	
