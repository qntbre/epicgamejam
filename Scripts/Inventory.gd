extends Control

#

#onready var grid = get_node("Inventory/Background/GridContainer")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var slot_canvas = preload("res://Scenes/InvCanvas.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func create_inv():

	var grid = get_node("Background/GridContainer")
	for itemSlot in Player.inv.keys():
		var new_slot = slot_canvas.instance()
		new_slot.set_name(itemSlot)
		grid.add_child(new_slot)


func display_inv():
	var grid = get_node("Background/GridContainer")
	
	for itemSlot in grid.get_children():
		
		if(str(itemSlot.name) in Player.inv.keys() and Player.inv[str(itemSlot.name)] != "0"):
			var icon_id = Player.inv[itemSlot.name]
			var icon_file = load("res://Assets/Items/" + GameData.items[str(icon_id)]["Image"])
			itemSlot.get_node("Icon").set_texture(icon_file)
		#if 



	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
