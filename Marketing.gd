extends Tabs

var paper = 0
var radio = 0
var billboard = 0
var mail = 0
var tv =0
var internet = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	
	paper = get_parent().get_parent().paper
	radio = get_parent().get_parent().radio
	billboard = get_parent().get_parent().billboard
	mail = get_parent().get_parent().mail
	tv = get_parent().get_parent().tv
	internet = get_parent().get_parent().internet
	
	
	get_node("Panel_TV/Label").text = str(tv)
	get_node("Panel_Paper/Label").text = str(paper)
	get_node("Panel_Radio/Label").text = str(radio)
	get_node("Panel_Billboard/Label").text = str(billboard)
	get_node("Panel_Mail/Label").text = str(mail)
	get_node("Panel_Internet/Label").text = str(internet)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
