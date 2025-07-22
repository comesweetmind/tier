extends Node2D

@onready var bullet_path = preload("res://character/bullet.tscn")
@onready var muzzle = $Marker2D

@export var max_bullets := 4 # за 4 постріли
var bullets := max_bullets # за 4 постріли

func _process(delta: float) -> void:
	# Якщо є патрони і натиснута кнопка — стріляємо
	if bullets > 0 and Input.is_action_just_pressed("shoot"): # за 4 постріли
		fire()
		
func _physics_process(delta: float) -> void:
	look_at(get_global_mouse_position())

func fire():
	bullets -= 1  # за 4 постріли віднімаємо 1 кулю
	#print("🔫 Постріл! Залишилось:", bullets) # за 4 постріли

	var bullet = bullet_path.instantiate()
		# Ставимо кулю в Marker2D
	bullet.global_position = muzzle.global_position

	bullet.dir=rotation
	bullet.pos=$".".muzzle.global_position
	bullet.rota=muzzle.global_rotation
	
	get_tree().current_scene.add_child(bullet)
