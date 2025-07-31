extends Node

var gun_default = {
	"name": "first_gun",
	"magazine": 0,         # Скільки зараз патронів у магазині
	"magazine_size": 5,    # Максимальний розмір магазину
	"ammo": 15,            # Скільки є запасних патронів
	"reload": 0.8          # Час перезарядки
}


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("reload"):
		print("Reload button pressed")
		gun_reload()


func gun_reload() -> void:
	var need = gun_default.magazine_size - gun_default.magazine
	if need <= 0:
		print("Магазин вже повний")
		return

	var to_reload = min(need, gun_default.ammo)
	gun_default.magazine += to_reload
	gun_default.ammo -= to_reload
	print("Reloaded: " + str(to_reload) + " патронів")
	print("Магазин: " + str(gun_default.magazine) + ", Залишок патронів: " + str(gun_default.ammo))
