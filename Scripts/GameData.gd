extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var items = {}
var boxes = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	

func load_data():
	var item_file = File.new()
	item_file.open("res://Assets/Items/ItemData.json", File.READ)
	items = JSON.parse(item_file.get_as_text()).result
	item_file.close()
	
	var box_file = File.new()
	box_file.open("res://Assets/Boxes/BoxData.json", File.READ)
	boxes = JSON.parse(box_file.get_as_text()).result
	box_file.close()
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
