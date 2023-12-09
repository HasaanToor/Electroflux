extends StaticBody2D

var pointsRequired = 200
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
		
		var tempHouse = tempArray.back() # get the most recent house
		if tempHouse.powerRequired > 0: # if house still needs power, adjust values accordingly
			tempHouse.powerRequired -= powerProduced
			Points.powerRequired -= powerProduced
			Points.points += powerProduced
			Points.powerProduced += powerProduced
			if tempHouse.powerRequired < 0: # if house has "negative" power requirement, adjust values to be normalized to 0
				Points.powerRequired += -tempHouse.powerRequired
				Points.points -= -tempHouse.powerRequired
				Points.powerProduced -= -tempHouse.powerRequired
				tempHouse.powerRequired += -tempHouse.powerRequired
		
		print(objectsInRange)
		print(tempArray)


func _on_mouse_entered():
	get_node("Area").show()

func _on_mouse_exited():
	get_node("Area").hide()
