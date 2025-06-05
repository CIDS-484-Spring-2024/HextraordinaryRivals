extends Control


#switches to the test level screen
func _on_play_pressed():
	get_tree().change_scene_to_file("res://Pages/TestLevel.tscn")


#closes game window
func _on_exit_pressed():
	get_tree().quit()
