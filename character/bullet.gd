extends CharacterBody2D
class_name Bullet
@onready var tween = create_tween()

var pos: Vector2
var speed := 250
var dir: float
var rota: float
var touch = 4


func _ready():
	global_position = pos
	global_rotation = rota
	velocity = Vector2(speed, 0).rotated(dir)

func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)
	if collision:
		touch -= 1
		if touch <= 0:
			call_deferred("queue_free")
		else:
			change_color_smooth()
			velocity = velocity.bounce(collision.get_normal())
		
	
func change_color_smooth():
	tween.tween_property(self, "modulate", Color(1, 0, 0), 0.5)  # до червоного за 0.5 секунди
