extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var items = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	

func load_data():
	var item_file = File.new()
	item_file.open("res://Assets/Items/ItemData.json", File.READ)
	items = JSON.parse(item_file.get_as_text()).result
	item_file.close()
	
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
