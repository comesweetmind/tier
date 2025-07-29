extends Node

var captured_monsters: Array = []
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func add_to_inventar(body):
	captured_monsters.append(body)
