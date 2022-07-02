extends Control

var slot_canvas = preload("res://Scenes/InvCanvas.tscn")

#onready var grid = get_node("Inventory/Background/GridContainer")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func create_inv(inv):

	var grid = get_node("Background/GridContainer")
	
	for itemSlot in inv.keys():
		var new_slot = slot_canvas.instance()
		new_slot.set_name(itemSlot)
		grid.add_child(new_slot)
		print(itemSlot)


func display_inv(inv, items):
	var grid = get_node("Background/GridContainer")
	
	for itemSlot in grid.get_children():
		if(itemSlot.name in inv.keys() and inv[itemSlot.name] != 0):
			var icon_id = inv[itemSlot.name]
			var icon_file = load("res://Assets/Items/" + items[str(icon_id)]["Image"])
			itemSlot.get_node("Icon").set_texture(icon_file)
		#if 



	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
