extends Tabs

var product_1 = 0
var product_10 = 0
var product_100 = 0
var product_1000 = 0
var product_Total_Items = 0
var price = 1.07

var Cost_1 = 0
var Cost_10 = 0
var Cost_100 = 0
var Cost_1000 = 0

var Cost_Total = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Label_1_Total").text  =str(0)
	get_node("Label_10_Total").text  =str(0)
	get_node("Label_100_Total").text  =str(0)
	get_node("Label_1000_Total").text  =str(0)
	get_node("Label_Total_Items").text = str(0)
	get_node("Label_Total_Total").text = str(product_Total_Items*price)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Right_1_pressed():
	product_1 += 1 
	product_Total_Items += 1
	get_node("Label_1_Total").text  =str(product_1)
	get_node("Label_Total_Total").text = str(product_Total_Items*price)	
	get_node("Label_Total_Items").text = str(product_Total_Items)	
	pass # Replace with function body.


func _on_Right_10_pressed():
	product_10 += 10 
	product_Total_Items += 10
	get_node("Label_10_Total").text  =str(product_10)
	get_node("Label_Total_Total").text = str(product_Total_Items*price)
	get_node("Label_Total_Items").text = str(product_Total_Items)
	pass # Replace with function body.


func _on_Right_100_pressed():
	product_100 += 100 
	product_Total_Items += 100
	get_node("Label_100_Total").text  =str(product_100)
	get_node("Label_Total_Total").text = str(product_Total_Items*price)
	get_node("Label_Total_Items").text = str(product_Total_Items)
	pass # Replace with function body.


func _on_Right_1000_pressed():
	product_1000 += 1000
	product_Total_Items += 1000
	get_node("Label_1000_Total").text  =str(product_1000)
	get_node("Label_Total_Total").text = str(product_Total_Items*price)
	get_node("Label_Total_Items").text = str(product_Total_Items)
	pass # Replace with function body.


func _on_Left_1_pressed():
	if product_1 -1 >= 0 && product_Total_Items - 1 >= 0:
		product_1 -=1
		product_Total_Items -= 1
		get_node("Label_1_Total").text  =str(product_1)
		get_node("Label_Total_Total").text = str(product_Total_Items*price)
		get_node("Label_Total_Items").text = str(product_Total_Items)
	pass # Replace with function body.


func _on_Left_10_pressed():
	if product_10 -10 >= 0 && product_Total_Items - 10 >= 0:
		product_10 -=10
		product_Total_Items -= 10
		get_node("Label_10_Total").text  =str(product_10)
		get_node("Label_Total_Total").text = str(product_Total_Items*price)
		get_node("Label_Total_Items").text = str(product_Total_Items)
	pass # Replace with function body.


func _on_Left_100_pressed():
	if product_100 -100 >= 0 && product_Total_Items - 100 >= 0:
		product_100 -=100
		product_Total_Items -= 100
		get_node("Label_100_Total").text  =str(product_100)
		get_node("Label_Total_Total").text = str(product_Total_Items*price)
		get_node("Label_Total_Items").text = str(product_Total_Items)
	pass # Replace with function body.


func _on_Left_1000_pressed():
	if product_1000 -1000 >= 0 && product_Total_Items - 1000 >= 0:
		product_1000 -=1000
		product_Total_Items -= 1000
		get_node("Label_1000_Total").text  =str(product_1000)
		get_node("Label_Total_Total").text = str(product_Total_Items*price)
		get_node("Label_Total_Items").text = str(product_Total_Items)
	pass # Replace with function body.


func _on_Confirm_pressed():
	get_parent().get_parent().get_parent().get_parent().addMoney(- product_Total_Items*price)
	get_parent().get_parent().get_parent().get_parent().addChanna(product_Total_Items)
	pass # Replace with function body.
