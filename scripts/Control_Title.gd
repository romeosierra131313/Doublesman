extends Control

func _ready():
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_TextureButton_House_pressed():
	get_node("TabContainer").current_tab = 0
	pass # Replace with function body.


func _on_TextureButton_Settings_pressed():
	get_node("TabContainer").current_tab = 1
	pass # Replace with function body.


func _on_TextureButton_Credits_pressed():
	get_node("TabContainer").current_tab = 2
	pass # Replace with function body.


func _on_TextureButton_Help_pressed():
	get_node("TabContainer").current_tab = 3
	pass # Replace with function body.


func _on_TextureButton_Quit_pressed():
	get_tree().quit()
	pass # Replace with function body.
