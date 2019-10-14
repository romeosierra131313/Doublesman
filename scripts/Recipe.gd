extends Tabs

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var Channa = 1
var Bhara = 2
var Chutney = 1
var Drinks = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Panel_Bhara/Sprite_Bhara/Label").text = str(Bhara)
	get_node("Panel_Channa/Sprite_Channa/Label").text = str(Channa)
	get_node("Panel_Chutney/Sprite_Chutney/Label").text = str(Chutney)
	get_node("Panel_Drinks/Sprite_Drinks/Label").text = str(Drinks)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Right_Channa_pressed():
	Channa += 1
	get_node("Panel_Channa/Sprite_Channa/Label").text = str(Channa)
	pass # Replace with function body.


func _on_Left_Channa_pressed():
	if Channa - 1 >= 1 :
		Channa -=1
		get_node("Panel_Channa/Sprite_Channa/Label").text = str(Channa)
	pass # Replace with function body.


func _on_Right_Bhara_pressed():
	Bhara += 1
	get_node("Panel_Bhara/Sprite_Bhara/Label").text = str(Bhara)
	pass # Replace with function body.

func _on_Left_Bhara_pressed():
	if Bhara - 1 >= 1:
		Bhara -= 1
		get_node("Panel_Bhara/Sprite_Bhara/Label").text = str(Bhara)
	pass # Replace with function body.


func _on_Right_Chutney_pressed():
	Chutney += 1
	get_node("Panel_Chutney/Sprite_Chutney/Label").text = str(Chutney)
	pass # Replace with function body.


func _on_Left_Chutney_pressed():
	if Chutney -1 >= 0:
		Chutney -= 1
		get_node("Panel_Chutney/Sprite_Chutney/Label").text = str(Chutney)
	pass # Replace with function body.




func _on_Right_Drinks_pressed():
	Drinks+= 1
	get_node("Panel_Drinks/Sprite_Drinks/Label").text = str(Drinks)
	pass # Replace with function body.


func _on_Left_Drinks_pressed():
	if Drinks - 1 >= 0 :
		Drinks -=1
		get_node("Panel_Drinks/Sprite_Drinks/Label").text = str(Drinks)
	pass # Replace with function body.


func _on_Button_Confirm_pressed():
	var Recipe =[Channa,Bhara,Chutney,Drinks]
	get_parent().get_parent().setRecipe(Recipe)
	get_parent().get_parent().updateOnCall()
	pass # Replace with function body.
