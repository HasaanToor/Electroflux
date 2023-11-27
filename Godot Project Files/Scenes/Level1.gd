extends Node2D

var path

# Called when the node enters the scene tree for the first time.
func _ready():
	path = get_tree().get_root().get_node("Level1/UI")

func _process(_delta):
	path.get_node("PointLabel").set_text("Points: " + str(Points.points))
