extends StaticBody2D

var powerRequired = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	set_pickable(true) # allows the object to detect the mouse cursor


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_mouse_entered():
	print(powerRequired)
