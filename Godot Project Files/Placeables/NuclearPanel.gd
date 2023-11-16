extends Panel

@onready var tower = preload("res://Placeables/Nuclear.tscn")
var validTile

func _on_gui_input(event):
	var tempTower = tower.instantiate()
	
	if event is InputEventMouseButton and event.button_mask == 1 and event.button_index == 1: # left click down
		tempTower.global_position = event.global_position # sets pos of tower to pos of mouse
		add_child(tempTower) # adds child to panel 
		tempTower.process_mode = Node.PROCESS_MODE_DISABLED
		
	elif event is InputEventMouseMotion and event.button_mask == 1: # left click down and mouse is moving (dragging)
		if get_child_count() > 1: # if the panel child exists (the placement hasn't been cancelled)
			
			# get the position of the tile and check if its valid to place the tower on
			var mapPath = get_tree().get_root().get_node("Level1/TileMap")
			var tile = mapPath.local_to_map(event.global_position)
			var snapTile = mapPath.map_to_local(tile)
			get_child(1).global_position = snapTile
			validTile = mapPath.get_cell_source_id(0, tile, false)
			
			# check if there are any towers already on a space
			var towerPath = get_tree().get_root().get_node("Level1/Towers")
			for i in towerPath.get_child_count():
				var pos = towerPath.get_child(i).global_position
				if pos == snapTile:
					validTile = -1
			
			# change colour of radius depending on validity of tile placement
			if (validTile == -1):
				get_child(1).get_node("Area").modulate = Color(1.0, 0.0, 0.0, 0.2)
			else:
				get_child(1).get_node("Area").modulate = Color(0.0, 0.0, 0.5, 0.2)
			
	elif event is InputEventMouseButton and event.button_mask == 0 and event.button_index == 1: # left click up
		if get_child_count() > 1: # if the panel child exists (the placement hasn't been cancelled)
			var pos = get_child(1).global_position # store position of child and delete it
			get_child(1).queue_free()
		
			if (validTile != -1):
				# add a new instance of the tower to the main scenes location at the panel child's position
				var towerPath = get_tree().get_root().get_node("Level1/Towers")
				towerPath.add_child(tempTower)
				tempTower.global_position = pos
				tempTower.get_node("Area").hide()
	else: # any other mouse event such as right clicking for example will cancel the placement of the tower by deleting the panel child
		if get_child_count() > 1:
			get_child(1).queue_free()
