extends Tabs

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var selection = 1

onready var coolerS  = load("res://icons/upgrades/UpgragePanels/Panel_coolerS.tscn")
onready var coolerM  = load("res://icons/upgrades/UpgragePanels/Panel_coolerM.tscn")
onready var coolerL  = load("res://icons/upgrades/UpgragePanels/Panel_coolerL.tscn")
onready var FcoolerS = load("res://icons/upgrades/UpgragePanels/Panel_FcoolerS.tscn")
onready var FcoolerM = load("res://icons/upgrades/UpgragePanels/Panel_FcoolerM.tscn")
onready var FcoolerL = load("res://icons/upgrades/UpgragePanels/Panel_FcoolerL.tscn")
onready var tent     = load("res://icons/upgrades/UpgragePanels/Panel_Tent.tscn")
onready var icemaker = load("res://icons/upgrades/UpgragePanels/Panel_IceMaker.tscn")
onready var van      = load("res://icons/upgrades/UpgragePanels/Panel_van.tscn")
onready var vanF     = load("res://icons/upgrades/UpgragePanels/Panel_vanF.tscn")
onready var kitchen  = load("res://icons/upgrades/UpgragePanels/Panel_Kitchen.tscn")
onready var register  = load("res://icons/upgrades/UpgragePanels/Panel_Register.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	var cs = coolerS.instance()
	cs.setCost(100)
	get_node("Panel").add_child(cs)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func setUpgrade(e):
	get_node("Panel").get_child(0).queue_free()
	var cs
	match e:
		1:
			cs = coolerS.instance()
			cs.setCost(100)
			get_node("Panel").add_child(cs)
			
		2:
			cs = coolerM.instance()
			cs.setCost(200)
			get_node("Panel").add_child(cs)
			
		3:
			cs = coolerL.instance()
			cs.setCost(300)
			get_node("Panel").add_child(cs)
		
		4:
			cs = FcoolerS.instance()
			cs.setCost(100)
			get_node("Panel").add_child(cs)
		5:
			cs = FcoolerM.instance()
			cs.setCost(200)
			get_node("Panel").add_child(cs)
		6:
			cs = FcoolerL.instance()
			cs.setCost(300)
			get_node("Panel").add_child(cs)
		7:
			cs = icemaker.instance()
			cs.setCost(2000)
			get_node("Panel").add_child(cs)
		8:
			cs = register.instance()
			cs.setCost(700)
			get_node("Panel").add_child(cs)
		9:
			cs = tent.instance()
			cs.setCost(13000)
			get_node("Panel").add_child(cs)
		10:
			cs = kitchen.instance()
			cs.setCost(27000)
			get_node("Panel").add_child(cs)
		11:
			cs = van.instance()
			cs.setCost(34000)
			get_node("Panel").add_child(cs)
		12:
			cs = vanF.instance()
			cs.setCost(52000)
			get_node("Panel").add_child(cs)
			
	
	pass
func _on_Right_pressed():
	if selection == 12:
		selection = 0
	if selection <12:
		selection +=1	
	setUpgrade(selection)
	pass # Replace with function body.


func _on_Left_pressed():
	
	if selection == 1:
		selection = 13
	if selection > 1:
		selection-=1
	setUpgrade(selection)
	pass # Replace with function body.


func _on_Button_Confirm_pressed():
	get_parent().get_parent().setUpgrade(selection)
	pass # Replace with function body.
