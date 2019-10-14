extends Panel
var popularity = 3
var customersSpawned = 0
var customercount =0
var customersServed = 0
var timerstarted = false
var money = 0
var time = 0  #spawnrate timer
var time2 = 0 #entity update timer
onready var en11 = load("res://Customer_1.tscn")
onready var Dollar = load("res://assets/font/$.tscn")
onready var Smiley = load("res://icons/Animation_Smiley.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	spawnCustomer(customercount)
	spawnPotentialCustomer()
	pass # Replace with function body.
func setPopularity(e):
	popularity = e
	pass
func getPopularity():
	return popularity
	pass
func setServiceTimer(e):
	get_node("Timer").wait_time = e 
	pass
func inc_customerCount(e):
	customercount += e
	pass
func spawnManyCustomers(e):
	for i in range(0,e):
		var r = randi()%2
		if r == 0:
			spawnPotentialCustomer()
		if r == 1:
			spawnCustomer(customercount)
		if r == 2:
			spawnCustomer(customercount)
	pass
	
			
func spawnPotentialCustomer():
	var c = en11.instance()
	var y = get_node("SCENE").get_rect().size.y-64
	c.setPosition(Vector2(randf()*get_rect().size.x+1,y))
	c.setLinePosition(13)
	get_node("SCENE").add_child(c)
	customercount +=1
	customersSpawned+=1
	pass
func spawnCustomer(e):
	
	var c = en11.instance()
	var y = get_node("SCENE").get_rect().size.y-64
	c.setPosition(Vector2(randf()*get_rect().size.x+1,y))
	var t = randi()%7
	c.setLinePosition(t)
	get_node("SCENE").add_child(c)
	customercount +=1
	customersSpawned+=1

	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	get_node("Timer/Label").text = str(get_node("Timer").time_left)
	
	time += delta
	time2 += delta
	#if time > spawnRate:
	#	spawnManyCustomers(popularity)
	#	time = 0
	if time2 > 2:
		updateLinePositions()
		time2 = 0
	if get_node("SCENE").get_child_count() > 1:
		for i in range(1,get_node("SCENE").get_child_count()):
			
			if timerstarted == false:
				if get_node("SCENE").get_child(i).getLinePosition() == 0 :
					if get_node("SCENE").get_child(i).getAtDestination() == true:	
						get_node("Timer").start()
						timerstarted = true;
				
	pass

func addMoney():
	get_parent().get_parent().makeSale()
	
	pass

func _on_Button_Start_pressed():
	
	pass # Replace with function body.

func updateLinePositions():
	for i in range(1,get_node("SCENE").get_child_count()):
		if get_node("SCENE").get_child(i).getLinePosition() >= 1 :
			if get_node("SCENE").get_child(i).gethasExited() == false:
				get_node("SCENE").get_child(i).setLinePosition(get_node("SCENE").get_child(i).getLinePosition()-1)	
		if get_node("SCENE").get_child(i).gethasExited() == true:
				customercount-=1
				get_node("SCENE").get_child(i).hide()
				get_node("SCENE").get_child(i).queue_free()	
				remove_child(get_node("SCENE").get_child(i))	
	pass
func _on_Timer_timeout():
	if get_node("SCENE").get_child_count() > 1:
		for i in range(1,get_node("SCENE").get_child_count()):
			if get_node("SCENE").get_child(i).getLinePosition() == 0 :	
				if get_node("SCENE").get_child(i).getAtDestination() == true:
					var d = Dollar.instance()
					get_node("SCENE/char_basic").add_child(d)
					get_node("SCENE").get_child(i).setExit()
					addMoney()
					customersServed -= 1
					get_node("SCENE").get_child(i).setLinePosition(customersServed)
					timerstarted = false;
					get_node("Timer").stop()
					break
				
	if get_node("SCENE").get_child_count() > 1:
		updateLinePositions()	
				
	
	
	pass # Replace with function body.
