extends MarginContainer

# code taken from https://youtu.be/fGKxr81iR7Y?si=pRLjcJhsTJHKyiiV

func _ready():
	var inGameMenu = get_node("VBoxContainer/MenuButton")
	var popUp = inGameMenu.get_popup()
	#send the ID from the pop-up button to MenuButton function
	popUp.id_pressed.connect(MenuButton)

#prints ID of each button to the console
#also changes scene back to the main menu. The disgusting, aesthetically appalling main menu
#TODO: currently does not reset the map as there is nothing to reset
func MenuButton(ID):
	#Godot Switch function
	match(ID):
		0:
			#TODO: future site of the reset button
			print("This is the reset, or button ID " + str(ID))
		1:
			#sends the player back to the main menu
			print("This is the main menu button, or button ID " + str(ID))
			get_tree().change_scene_to_file("res://menu.tscn")
