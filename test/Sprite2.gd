extends Sprite

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _movex():
	move_local_x(1)
	pass # Replace with function body.
func _movey():
	move_local_y(1)
	pass # Replace with function body.
func _ready():
	
	pass # Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move_local_y(1)
	pass
