extends Node

var inv = {"Inv1": "10002", "Inv2": "10005", "Inv3": "0", "Inv4": "0"}
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	#setup()
	pass 

func setup():
	GameData.load_data()
	Inventory.create_inv()
	update()
	
func update():
	Inventory.display_inv()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
