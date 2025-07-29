#extends Control
#
#@onready var list = $ItemList
#@onready var enemy_image = $TextureRect
#@onready var enemy_name = $EnemyName
#@onready var enemy_desc = $EnemyDescription
#
#func _ready():
	#update_list()
#
#func update_list():
	#list.clear()
	#for enemy_id in data.enemies.keys():
		#if Bestiary.is_unlocked(enemy_id):
			#list.add_item(Bestiary.enemies[enemy_id]["name"])
		#else:
			#list.add_item("???")

#func _on_ItemList_item_selected(index):
	#var enemy_id = Bestiary.enemies.keys()[index]
	#if Bestiary.is_unlocked(enemy_id):
		#var enemy = Bestiary.enemies[enemy_id]
		#enemy_name.text = enemy["name"]
		#enemy_desc.text = enemy["description"]
		#enemy_image.texture = load(enemy["image"])
	#else:
		#enemy_name.text = "???"
		#enemy_desc.text = "Неизвестное существо"
		#enemy_image.texture = null
