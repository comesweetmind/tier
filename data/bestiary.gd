extends Node2D




# Called when the node enters the scene tree for the first time.
func _ready():
	load_bestiary()


func load_bestiary():
	var file = FileAccess.open("res://data/bestiary.json", FileAccess.READ)
	if file:
		var text = file.get_as_text()
		var dataBestiary = JSON.parse_string(text)
		if typeof(dataBestiary) == TYPE_DICTIONARY:
			print(dataBestiary) # Выведет словарь
		else:
			print("Ошибка парсинга JSON!")
