extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	#Player.setup()
	Inventory.start_hide()
	Inventory.do_hide()
	
	var ite = GameData.chosenItem
	
	if(str(ite) in GameData.items.keys()):
		var icon_file = load("res://Assets/Items/" + GameData.items[str(ite)]["Image"])
		get_node("Item/Element").set_texture(icon_file)
		get_node("Item/Element").set_name(str(ite))
	
	#CanvasLayer.AnimationPlayer.play("fade_to_normal")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
