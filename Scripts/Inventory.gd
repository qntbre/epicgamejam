extends Control

#

#onready var grid = get_node("Inventory/Background/GridContainer")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var slot_canvas = preload("res://Scenes/InvCanvas.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	do_hide()
	pass

func do_hide():
	self.hide()
	get_node("CanvasLayer/Background").hide()
	get_node("CanvasLayer/Info").hide()
	
func do_show():
	self.hide()
	get_node("CanvasLayer/Background").show()
	get_node("CanvasLayer/Info").show()

func create_inv():
	var grid = get_node("CanvasLayer/Background/GridContainer")
	for itemSlot in Player.inv.keys():
		var new_slot = slot_canvas.instance()
		new_slot.set_name(itemSlot)
		new_slot.get_node("Icon").name = Player.inv[itemSlot]
		grid.add_child(new_slot)


func display_inv():
	var grid = get_node("CanvasLayer/Background/GridContainer")
	
	for itemSlot in grid.get_children():
		
		if(str(itemSlot.name) in Player.inv.keys() and Player.inv[str(itemSlot.name)] != "0"):
			var icon_id = Player.inv[itemSlot.name]
			var icon_file = load("res://Assets/Items/" + GameData.items[str(icon_id)]["Image"])
			itemSlot.get_children()[0].set_texture(icon_file)
		#if 

	pass # Replace with function body.


func display_infos(id):
	
	
	if (id == "0"):
		#get_node("Info").hide()
		get_node("CanvasLayer/Info/AnimationPlayer").play("bouge")
		pass
	else:
		if(str(id) in GameData.items.keys()):
			#get_node("CanvasLayer/Info").show()
			#s
			get_node("CanvasLayer/Info/AnimationPlayer").play_backwards("bouge")

			var thisitem = GameData.items[id]
			
			get_node("CanvasLayer/Info/Description").set_text(str(thisitem["Desc"]))
			get_node("CanvasLayer/Info/Name").set_text(str(thisitem["Name"]))
			get_node("CanvasLayer/Info/Price").set_text(str(thisitem["Price"]))
			get_node("CanvasLayer/Info/Weight").set_text(str(thisitem["Weight"]))
		
	

	pass # Replace with function body.
