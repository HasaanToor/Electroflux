extends StaticBody2D

var powerProduced = 100

var objectsInRange = []

# Called when the node enters the scene tree for the first time.
func _ready():
	set_pickable(true) # allows the object to detect the mouse cursor

func _on_tower_body_entered(body):
	if "House" in body.name:
		var tempArray = []
		objectsInRange = get_node("Tower").get_overlapping_bodies() # gets all the objects in the range of the tower (including itself)
		
		for i in objectsInRange:
			if "House" in i.name:
				tempArray.append(i) # array of just Houses in range
		
		var tempHouse = tempArray.back()
		if tempHouse.powerRequired > 0:
			tempHouse.powerRequired -= powerProduced
		
		print(objectsInRange)
		print(tempArray)


func _on_mouse_entered():
	get_node("Area").show()

func _on_mouse_exited():
	get_node("Area").hide()
