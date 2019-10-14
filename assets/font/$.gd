extends Sprite

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var  y = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	y = position.y
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y -=1
	if y - position.y >= 16:
		queue_free()
	
	pass
