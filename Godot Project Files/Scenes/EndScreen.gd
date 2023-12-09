extends Control

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Label").hide()
	get_node("Label2").hide()
	get_node("Label3").hide()
	
	var number = rng.randi_range(1, 3)
	
	if number == 1:
		get_node("Label").show()
	elif number == 2:
		get_node("Label2").show()
	else:
		get_node("Label3").show()


func _on_menu_pressed():
	get_tree().change_scene_to_file("res://MainMenu/MainMenu.tscn")


func _on_tips_pressed():
	OS.shell_open("https://www.directenergy.com/learning-center/25-energy-efficiency-tips")
