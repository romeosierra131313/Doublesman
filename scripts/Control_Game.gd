extends Control
var time2 = 0
var time = 0
var daylength =30
var dayStarted  = false
var spawnRate = 27
var spawnRateModifier = 0
var serviceRate = 10
var popularity = 3
var ProductMovedYesterday = 0
var currentMonth = 0

# Declare member variables here. Examples:
var Channa = 100
var Bhara = 100
var Chutney = 100
var Drinks = 100
var Doubles = 0
var Recipe =[1,2,1,1]
var money = 100000
var price = 5
var ProductSold = 0 
# var b = "text"

var paper = 10
var radio = 300
var billboard = 1200
var mail = 45
var tv = 3100
var internet = 0

var coolerS  = false
var coolerM  = false
var coolerL  = false
var FcoolerS = false
var FcoolerM = false
var FcoolerL = false
var Register = false
var Icemaker = false
var tent     = false
var kitchen  = false
var van      = false
var vanF     = false

var scene1 = true;

onready var en11 = load("res://Scene1_viewport.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	calculateProduct()
	updateOnCall()
	updateDebug()
	
	currentMonth = get_node("Panel_Info").getMonth()
	pass # Replace with function body.
func resetFlags():
	updateDebug()
	time = 0
	dayStarted = true
	spawnRate = 18
	spawnRateModifier = 0
	serviceRate = 10
	popularity = 2
	ProductMovedYesterday = 0
	paper = 10
	radio = 300
	billboard = 1200
	mail = 45
	tv = 3100
	internet = 0
	
	pass
func setUpgrade(e):
	
	
	match e:
		1:
			
			if coolerS == false:
				coolerS = true
				addMoney(-get_node("TabContainer/Upgrades/Panel").get_child(0).getCost())
		2:
			
			if coolerM == false:
				coolerM = true
				addMoney(-get_node("TabContainer/Upgrades/Panel").get_child(0).getCost())
		3:
			
			if coolerL == false:
				coolerL = true
				addMoney(-get_node("TabContainer/Upgrades/Panel").get_child(0).getCost())
		4:
			
			if FcoolerS == false:
				FcoolerS = true
				addMoney(-get_node("TabContainer/Upgrades/Panel").get_child(0).getCost())
		5:
			if FcoolerM == false:
				FcoolerM = true
				addMoney(-get_node("TabContainer/Upgrades/Panel").get_child(0).getCost())
		6:
			if FcoolerL == false:
				FcoolerL = true
				addMoney(-get_node("TabContainer/Upgrades/Panel").get_child(0).getCost())
		7:
			if Icemaker == false:
				Icemaker = true
				addMoney(-get_node("TabContainer/Upgrades/Panel").get_child(0).getCost())
		8:
			if Register == false:
				Register = true
				addMoney(-get_node("TabContainer/Upgrades/Panel").get_child(0).getCost())
		9:
			if tent == false:
				tent = true
				addMoney(-get_node("TabContainer/Upgrades/Panel").get_child(0).getCost())
		10:
			if kitchen == false:
				kitchen = true
				addMoney(-get_node("TabContainer/Upgrades/Panel").get_child(0).getCost())
		11:
			if van == false:
				van = true
				addMoney(-get_node("TabContainer/Upgrades/Panel").get_child(0).getCost())
		12:
			if vanF == false:
				vanF = true
				addMoney(-get_node("TabContainer/Upgrades/Panel").get_child(0).getCost())
	
	pass
func applyUpgrades():
	if coolerS == true:
		spawnRateModifier+=0.3	
		serviceRate -=0.3
	if coolerM == true:
		spawnRateModifier+=0.7	
		serviceRate -=0.4
	if coolerL == true:
		spawnRateModifier+=0.9
		serviceRate -=0.5
	if FcoolerS == true:
		spawnRateModifier+=0.3	
		serviceRate -=0.3
	if FcoolerM == true:
		spawnRateModifier+=0.7
		serviceRate -=0.4
	if FcoolerL == true:
		spawnRateModifier+=0.9
		serviceRate -=0.5
	if Icemaker == true:
		popularity+= 2
		serviceRate +=0.2	
		spawnRateModifier+=0.4
	if Register == true:
		serviceRate -=1	
		spawnRateModifier+=0.3
	if tent == true:
		popularity+= 3
		spawnRateModifier+=0.5
	if kitchen == true:
		popularity+= 1
		serviceRate -=3
		spawnRateModifier+=0.5
	if van == true:
		popularity+= 2
		serviceRate -=1.7	
		spawnRateModifier+=1
	if vanF == true:
		popularity+= 2
		serviceRate -=2	
		spawnRateModifier+=1.5
	pass

func updateDebug():
	get_node("TabContainer/Results/Panel/Label_Performance/Label_SpawnRate/Label").text = str(spawnRate)
	get_node("TabContainer/Results/Panel/Label_Performance/Label_SeriveRate/Label").text = str(serviceRate)
	get_node("TabContainer/Results/Panel/Label_Performance/Label_Popularity/Label").text = str(popularity)
func updateSpawnRate(e):
	print(e)
	spawnRate -= spawnRateModifier
	updateDebug()
	pass
func applyAds():
	print("reseting spawnRate")
	var rate = 0
	if scene1 ==true:
		rate += 2
		if get_node("TabContainer/Marketing/Panel_Paper/CheckBox").pressed == true:
			rate +=.2
		if get_node("TabContainer/Marketing/Panel_Radio/CheckBox").pressed == true:
			rate +=.8
		if get_node("TabContainer/Marketing/Panel_Billboard/CheckBox").pressed == true:
			rate +=.8
		if get_node("TabContainer/Marketing/Panel_Internet/CheckBox").pressed == true:
			rate +=.8
		if get_node("TabContainer/Marketing/Panel_TV/CheckBox").pressed == true:
			rate +=1.3
			
	spawnRateModifier+=rate
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time2 += delta
	if get_node("PanelContainer").get_child_count() == 1:
			if time2 > spawnRate:
				get_node("PanelContainer").get_child(0).spawnManyCustomers(popularity)
				time2 = 0
			
	if dayStarted == false:
		if get_node("PanelContainer").get_child_count() == 1:
			if get_node("PanelContainer").get_child(0).get_child(0).get_child_count() == 1:
				StartDay()
	time += delta
	get_node("TabContainer/Results/Panel/Label_Performance/Label_DayLeft/Label").text = str(time)
	
	if time > daylength:
		
		EndDay()
		
	pass
func setRecipe(e):
	Recipe = e
	pass
func calculateProduct():
	Doubles = 0;
	
	var temp_channa = Channa
	var temp_bhara = Bhara
	var temp_chutney = Chutney
	var temp_drinks = Drinks
	
	while temp_channa >= 0 && temp_bhara >= 0 && temp_chutney >= 0 && temp_drinks >= 0:
		temp_channa -= Recipe[0]
		temp_bhara -=  Recipe[1]
		temp_chutney -= Recipe[2]
		temp_drinks -= Recipe[3]	
		
		Doubles += 1
	
	pass
func updateEveryTick():
	get_node("Sprite_Channa/Label").text = str(Channa)
	get_node("Sprite_Bhara/Label").text = str(Bhara)
	get_node("Sprite_Chutney/Label").text =str(Chutney)
	get_node("Sprite_Drinks/Label").text = str(Drinks)
	
	pass
	
func updateOnCall():
	get_node("Sprite_Channa/Label").text = str(Channa)
	get_node("Sprite_Bhara/Label").text = str(Bhara)
	get_node("Sprite_Chutney/Label").text =str(Chutney)
	get_node("Sprite_Drinks/Label").text = str(Drinks)
	get_node("Sprite_Doubles/Label").text = str(Doubles)
	get_node("Label_$/Label").text = str(money)
	get_node("TabContainer/Results/Panel/Label_Performance/Label_ProductSold/Label").text  =str(ProductSold)

	pass	
func makeSale():
	
	Channa -= Recipe[0]
	Bhara -=  Recipe[1]
	Chutney -= Recipe[2]
	Drinks -= Recipe[3]
	Doubles -= 1
	ProductSold +=1
	addMoney(price)
	
	ProductMovedYesterday += 1
	get_node("TabContainer/Results/Panel/Label_Performance/Label_ProductOneDay/Label").text = str(ProductMovedYesterday)
	pass
func getMoney():
	return money
	pass
func addMoney(e):
	money += e
	updateOnCall()
	pass
func addChanna(e):
	Channa += e
	calculateProduct()
	updateOnCall()
	pass
func addBhara(e):
	Bhara += e
	calculateProduct()
	updateOnCall()
	pass
func addChutney(e):
	Chutney += e
	calculateProduct()
	updateOnCall()
	pass
func addDrinks(e):
	Drinks += e
	calculateProduct()
	updateOnCall()
	pass
func payAdverts():
	print("paying for ads")
	if get_node("TabContainer/Marketing/Panel_Paper/CheckBox").pressed == true:
		addMoney(-paper)
	if get_node("TabContainer/Marketing/Panel_Internet/CheckBox").pressed == true:
		addMoney(-internet)
	
		
	if currentMonth != get_node("Panel_Info").getMonth():
		if get_node("TabContainer/Marketing/Panel_TV/CheckBox").pressed == true:
			addMoney(-tv)
		if get_node("TabContainer/Marketing/Panel_Radio/CheckBox").pressed == true:
			addMoney(-radio)
		if get_node("TabContainer/Marketing/Panel_Billboard/CheckBox").pressed == true:
			addMoney(-billboard)
		currentMonth = get_node("Panel_Info").getMonth()
	pass
func StartDay():
	get_node("Panel_Info").incDay()
	if get_node("PanelContainer").get_child_count() == 1:
		get_node("PanelContainer").get_child(0).queue_free()
	var scene = en11.instance()
	get_node("PanelContainer").add_child(scene)
	
	###RESET####
	resetFlags()
	
	payAdverts()
	#####MODIFY####
	applyAds()
	applyUpgrades()
	
	#####APPLY#####
	updateSpawnRate(spawnRateModifier)
	
	get_node("PanelContainer").get_child(0).setServiceTimer(0)
	get_node("PanelContainer").get_child(0).setPopularity(popularity)
	updateDebug()
	
	get_node("TabContainer/Results/Panel/Label_Performance/Label_ProductOneDay/Label").text = str(ProductMovedYesterday)
	ProductMovedYesterday = 0
	
	
	
	pass
func EndDay():
	
	if dayStarted == true:
		print("ending day setting spawn rate low")
		spawnRate = 300
		for i in range( 1,get_node("PanelContainer").get_child(0).get_child_count()):
			makeSale()
		get_node("PanelContainer").get_child(0).queue_free()
		dayStarted = false
		StartDay()
	pass
func _on_Button_Start_pressed():
	StartDay()
	pass # Replace with function body.


func _on_HSlider_servicetime_value_changed(value):
	get_node("PanelContainer").get_child(0).setServiceTimer(0.00001)
	get_node("TabContainer/Results/Panel/HSlider_servicetime/Label2").text = str(value)
	pass # Replace with function body.
