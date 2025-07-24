extends CharacterBody2D
class_name Bullet
@onready var tween = create_tween()

var pos: Vector2
var speed := 250
var dir: float
var rota: float
var touch = 4
var collor = 1


func _ready():
	global_position = pos
	global_rotation = rota
	velocity = Vector2(speed, 0).rotated(dir)

func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)
	if collision:
		change_color_smooth()
		touch -= 1
		collor += 1
		
		if touch <= 0:
			call_deferred("queue_free")
		else:
			change_color_smooth()
			velocity = velocity.bounce(collision.get_normal())
		
	
func change_color_smooth():
	if collor == 2:
		$Sprite2D.self_modulate = Color(0, 1, 0)
	if collor == 3:
		$Sprite2D.self_modulate = Color(1, 1, 0)
	if collor == 4:
		$Sprite2D.self_modulate = Color(1, 0, 0)
