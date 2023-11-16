extends StaticBody2D

var powerRequired = 150

# Called when the node enters the scene tree for the first time.
func _ready():
	set_pickable(true) # allows the object to detect the mouse cursor


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if powerRequired < 0:
		powerRequired = 0
		
	get_node("Label").set_text(str(powerRequired))


func _on_mouse_entered():
	print(powerRequired)
