extends Node2D

const CELL_SIZE := 24
const EMPTY := -1

@export var width: int = 16
@export var height: int = 16

var cells: Array[int] = []
var current_colour_id: int = 0

var palette: Array[Color] = [
	Color.WHITE,
	Color.RED,
	Color.BLUE,
	Color.BLACK
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	cells.resize(width * height)
	
	for ix in range(width * height):
		cells[ix] = EMPTY
		
func to_index(x: int, y: int) -> int:
	return y * width + x
	
func _draw() -> void:
	# draw background
	var plate_size = Vector2(width * CELL_SIZE, height * CELL_SIZE)
	draw_rect(Rect2(Vector2.ZERO, plate_size), Color(0.15, 0.15, 0.15))

	# draw grid + studs
	for y in range(height):
		for x in range(width):
			var pos = Vector2(x * CELL_SIZE, y * CELL_SIZE)

			# grid line
			draw_rect(Rect2(pos, Vector2(CELL_SIZE, CELL_SIZE)), Color(0.25, 0.25, 0.25), false)

			var index := to_index(x, y)
			var colour_id := cells[index]
			if colour_id != EMPTY:
				# smaller rect inside the cell to look like a stud
				var inset := 3.0
				var stud_rect := Rect2(
					pos + Vector2(inset, inset),
					Vector2(CELL_SIZE - 2 * inset, CELL_SIZE - 2 * inset)
				)
				draw_rect(stud_rect, palette[colour_id])
				
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		# plate-local coordinates
		var local_pos := to_local(event.position)
		var x := int(floor(local_pos.x / CELL_SIZE))
		var y := int(floor(local_pos.y / CELL_SIZE))

		# bounds check
		if x < 0 or x >= width or y < 0 or y >= height:
			return
			
		var index := to_index(x, y)
		#print(index)

		if event.button_index == MOUSE_BUTTON_LEFT:
			cells[index] = current_colour_id
		elif event.button_index == MOUSE_BUTTON_RIGHT:
			cells[index] = EMPTY

		queue_redraw()

func set_colour(colour_id: int):
	current_colour_id = colour_id
