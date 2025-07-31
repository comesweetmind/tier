extends CharacterBody2D
#enum {
	#MOVE,
#}

@export var SPEED = 200
@onready var animated_sprite = $AnimatedSprite2D  # подключаем AnimatedSprite2D
@onready var gun = $Gun

# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#print(gun.bullets)
	
func _process(delta: float) -> void:
	
	var bullets = gun.magazine

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
	if direction != Vector2.ZERO:
		if direction.y < 0:
			animated_sprite.play("Walk_top")
		elif direction.y > 0:
			animated_sprite.play("Walk_down")
		elif direction.x < 0:
			animated_sprite.flip_h = true
			animated_sprite.play("Walk_left")  # или "Walk_side"
		elif direction.x > 0:
			animated_sprite.flip_h = false
			animated_sprite.play("Walk_left")  # тот же спрайт, но зеркально
	else:
		animated_sprite.play("Idle")
	
	move_and_slide()

	
	
