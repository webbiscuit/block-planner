extends Button

@export var colour_id: int

func _ready() -> void:
	pressed.connect(_on_pressed)

func _on_pressed() -> void:
	get_tree().call_group("palette_listeners", "set_colour", colour_id)
