extends StaticBody2D

var objectsInRange = []
var currObject



func _on_tower_body_entered(body):
	# if "House" in body.name:
	
	var tempArray = []
	objectsInRange = get_node("Tower").get_overlapping_bodies() # gets the objects in the range of the tower
	
	for i in objectsInRange:
		if "House" in i.name:
			tempArray.append(i)
	
	
	
	
	



func _on_tower_body_exited(body):
	pass # Replace with function body.
