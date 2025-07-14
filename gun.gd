extends Node2D

@onready var bullet_path = preload("res://bullet.tscn")
@onready var muzzle = $Marker2D

func _physics_process(delta: float) -> void:
	look_at(get_global_mouse_position())
	if Input.is_action_just_pressed("soot"):
		fire()

func fire():
	
	var bullet = bullet_path.instantiate()
		# Ставимо кулю в Marker2D
	bullet.global_position = muzzle.global_position

	bullet.dir=rotation
	bullet.pos=$".".muzzle.global_position
	bullet.rota=muzzle.global_rotation
	
	get_tree().current_scene.add_child(bullet)
