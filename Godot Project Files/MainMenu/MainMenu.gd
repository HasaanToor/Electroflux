extends Control

func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/Level1.tscn")
	Points.powerProduced = 0
	Points.points = 0

func _on_how_to_play_pressed():
	get_tree().change_scene_to_file("res://MainMenu/HowToPlayMenu.tscn")

func _on_exit_pressed():
	get_tree().quit()
