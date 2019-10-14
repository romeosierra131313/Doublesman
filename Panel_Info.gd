extends Panel

var Year = 2000
var Month = 1
var Day = 1
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Panel_Calendar/Year/Label").text = str(Year)
	get_node("Panel_Calendar/Month/Label").text = str(Month)	
	get_node("Panel_Calendar/Day/Label").text = str(Day)	
	pass # Replace with function body.
func getMonth():
	return Month
	pass
func incYear():
	Year += 1
	get_node("Panel_Calendar/Year/Label").text = str(Year)
	pass
func incMonth():
	if Month == 12:
		incYear()
		Month = 0
	if Month <=11:
		Month +=1
	get_node("Panel_Calendar/Month/Label").text = str(Month)	
	pass
func incDay():
	match Month:
		3,5,8,10:
			
			if Day == 31:
				Day = 0
				incMonth()
			if Day < 31:
				Day +=1
		1,7,12 :
			if Day == 31:
				Day = 0
				incMonth()
			if Day < 31:
				Day +=1
		4,6,9,11 :
			if Day == 30:
				Day = 0
				incMonth()
			if Day < 30:
				Day +=1
				get_node("Panel_Calendar/Day/Label").text = str(Day)
			
		2:
			if Year%4 == 0:
				if Day == 29:
					Day = 0
					incMonth()
				if Day < 29:
					Day +=1
					get_node("Panel_Calendar/Day/Label").text = str(Day)
			if Year%4 != 0:
				if Day == 28:
					Day = 0
					incMonth()
				if Day < 28:
					Day +=1	
	get_node("Panel_Calendar/Day/Label").text = str(Day)	
	
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	pass


func _on_Button_pressed():
	incDay()
	pass # Replace with function body.
