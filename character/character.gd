extends CharacterBody2D

@export var SPEED = 200
var BULLET = 4


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	pass
# Отримуємо глобальну позицію курсора
	#var mouse_pos = get_global_mouse_position()
	# Обчислюємо напрямок від гравця до миші
	#var direction = (mouse_pos - global_position).angle()
	# Повертаємо гравця (або спрайт)
	#$Sprite2D.rotation = direction + deg_to_rad(90)
	
	#print(mouse_pos)
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
# НАПРЯМОК	
	var direction = Vector2.ZERO

	if Input.is_action_pressed("walk_left"):
		direction.x -= 1
	if Input.is_action_pressed("walk_right"):
		direction.x += 1
	if Input.is_action_pressed("walk_up"):
		direction.y -= 1
	if Input.is_action_pressed("walk_down"):
		direction.y += 1

	# Нормалізуємо напрямок, щоб діагоналі не були швидші
	if direction != Vector2.ZERO:
		direction = direction.normalized()
	# Обчислюємо швидкість
	velocity = direction * SPEED
	
	#print(velocity)

	move_and_slide()
