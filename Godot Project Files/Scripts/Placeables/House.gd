extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# gets the top left position (origin) of the tile the mouse is hovering over and sets that as the position for the sprite
	var mouse_tile = GameManager.tilemap.local_to_map(get_global_mouse_position() - Vector2(16,20))
	var local_pos = GameManager.tilemap.map_to_local(mouse_tile)
	var world_pos = GameManager.tilemap.to_global(local_pos)
	global_position = world_pos
	

func _unhandled_input(event):
	if event is InputEventMouseButton && event.pressed && event.button_index == MOUSE_BUTTON_LEFT:
		set_process(false)
		set_process_unhandled_input(false)
