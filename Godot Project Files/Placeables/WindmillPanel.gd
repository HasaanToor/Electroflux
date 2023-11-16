extends Panel

@onready var tower = preload("res://Placeables/Windmill.tscn")
var currTile

func _on_gui_input(event):
	var tempTower = tower.instantiate()
	
	if event is InputEventMouseButton and event.button_mask == 1 and event.button_index == 1: # left click down
		tempTower.global_position = event.global_position # sets pos of tower to pos of mouse
		add_child(tempTower) # adds child to panel 
		tempTower.process_mode = Node.PROCESS_MODE_DISABLED
		
	elif event is InputEventMouseMotion and event.button_mask == 1: # left click down and mouse is moving (dragging)
		if get_child_count() > 1: # if the panel child exists (the placement hasn't been cancelled)
			get_child(1).global_position = event.global_position
			
			var mapPath = get_tree().get_root().get_node("Level1/TileMap")
			var tile = mapPath.local_to_map(event.global_position)
			currTile = mapPath.get_cell_source_id(0, tile, false)
			print(currTile)
			if (currTile):
				get_child(1).get_node("Area").modulate = Color(00006450)
			else:
				get_child(1).get_node("Area").modulate = Color(0, 0, 100, 80)
			
	elif event is InputEventMouseButton and event.button_mask == 0 and event.button_index == 1: # left click up
		if get_child_count() > 1: # if the panel child exists (the placement hasn't been cancelled)
			var pos = get_child(1).global_position # store position of child and delete it
			get_child(1).queue_free()
		
			# add a new instance of the tower to the main scenes location at the panel child's position
			var towerPath = get_tree().get_root().get_node("Level1/Towers")
			towerPath.add_child(tempTower)
			tempTower.global_position = pos
			tempTower.get_node("Area").hide()
	else: # any other mouse event such as right clicking for example will cancel the placement of the tower by deleting the panel child
		if get_child_count() > 1:
			get_child(1).queue_free()
