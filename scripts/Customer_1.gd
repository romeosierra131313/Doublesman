extends Sprite

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var line0 = Vector2(256,256)
export var line1 = Vector2(264,264)
export var line2 = Vector2(272,272)
export var line3 = Vector2(280,280)
export var line4 = Vector2(288,288)
export var line5 = Vector2(296,296)
export var line6 = Vector2(304,304)

export var exit0= Vector2(256,450)
export var exit1= Vector2(450,200)
export var exit2= Vector2(0,400)
var time = 0
var destination = Vector2(0,0)
var linePosition = -1
var atDestination = false;
var hasExited = false
# Called when the node enters the scene tree for the first time.
func _ready():
	self.hide()

	pass # Replace with function body.
func gethasExited():
	return hasExited
	pass
	
func wonder():
	setExit()
	pass
func setExit():
	
	var e = randi()%3
	match e:
		0:
			setDestination(exit0)
		1:
			setDestination(exit1)
		2:
			setDestination(exit2)
	
	pass	
func setAtDestination(e):
	atDestination = e
	pass	
func getAtDestination():
	return atDestination
	pass
func getLinePosition():
	return linePosition
	pass
func setLinePosition(e):
	var rx =  randi()%48
	var ry =  randi()%32
	linePosition = e 
	match linePosition:
		0: 
			var f = Vector2(line2.x,line2.y)
			f.x = f.x + rx
			f.x = f.x - ry
			setDestination(f)
			get_node("Timer").stop()
		1:	
			var f = Vector2(line2.x,line2.y)
			f.x = f.x + rx
			f.x = f.x - ry
			setDestination(f)
			get_node("Timer").stop()
		2: 
			var f = Vector2(line2.x,line2.y)
			f.x = f.x + rx
			f.x = f.x - ry
			setDestination(f)	
			get_node("Timer").stop()
		3: 
			var f = Vector2(line3.x,line3.y)
			f.x = f.x + rx
			f.x = f.x - ry
			setDestination(f)
			get_node("Timer").stop()
		4: 
			var f = Vector2(line4.x,line4.y)
			f.x = f.x + rx
			f.x = f.x - ry
			setDestination(f)
			get_node("Timer").stop()
		5: 
			var f = Vector2(line5.x,line5.y)
			f.x = f.x + rx
			f.x = f.x - ry
			setDestination(f)
			get_node("Timer").start()
		6: 
			var f = Vector2(line6.x,line6.y)
			f.x = f.x + rx + 16
			f.x = f.x - ry - 16
			setDestination(f)
			get_node("Timer").start()
		#7,8,9,10,11,12,13,14,15,16,17,18: 
		_:	
			setDestination(exit1)
		

	pass
func setDestination(e):

	destination =e
	atDestination= false
	pass
func getPosition():
	
	return position
	pass
func setPosition(e):
	position.x = int(e.x)
	position.y = int(e.y)
	pass
func moveX(e):
	position.x += e
	pass
func moveY(e):
	position.y += e
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_node("Label").text = str(linePosition)
	get_node("Label2").text = str(get_node("Timer").time_left)
	if position.x > 450 || position.y > 450:
		self.hide()
	if position.x < 450 && position.y < 450:
		self.show()
	
	time +=delta
	if time >= 0.0001:
		if destination == position:
			atDestination = true
			
			if position== exit0 || position== exit1 || position== exit2:
				hasExited = true
	
				
	if destination != position:
		if destination.x < position.x:
			moveX(-1)
		if destination.x > position.x:
			moveX(1)
		if destination.y < position.y:
			moveY(-1)
		if destination.y > position.y:
			moveY(1)
	time = 0
	pass





func _on_Timer_timeout():
	setLinePosition(18)
	pass # Replace with function body.
