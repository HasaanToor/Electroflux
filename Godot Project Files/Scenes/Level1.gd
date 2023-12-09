extends Node2D

var path

# Called when the node enters the scene tree for the first time.
func _ready():
	path = get_tree().get_root().get_node("Level1/UI")
	
	var towerPath = get_tree().get_root().get_node("Level1/Towers")
	Points.powerRequired = towerPath.get_child_count() * 150

func _process(_delta):
	path.get_node("PowerRequiredLabel").set_text("Power Required:⚡" + str(Points.powerRequired))
	path.get_node("PowerProducedLabel").set_text("Power Produced:⚡" + str(Points.powerProduced))
	path.get_node("PointLabel").set_text("Points:✨" + str(Points.points))
	
	if Points.powerRequired <= 0:
		get_tree().change_scene_to_file("res://Scenes/EndScreen.tscn")
