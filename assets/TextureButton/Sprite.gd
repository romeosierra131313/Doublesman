extends Sprite

# Declare member variables here. Examples:
var a = 0
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	a += delta
	if a >.25:
		a = 0
		
		
	pass
