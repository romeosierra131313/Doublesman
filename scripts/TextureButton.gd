extends TextureButton

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Sprite_buttonBack").hide()
	get_node("Sprite_buttonentered").show()
	pass # Replace with function body.
func _setTextureup():
	get_node("Sprite_buttonBack").show()
	get_node("Sprite_buttonentered").hide()	
	pass
func _setTexturedown():
	get_node("Sprite_buttonBack").hide()
	get_node("Sprite_buttonentered").show()
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
