extends TextureRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func can_drop_data(_position, _data):
	return (true)
	
func drop_data(_position, data):
	#texture = data["texture"]
	if ("id2" in data.keys()):
		#Inve
		print(data["id2"])
		yield(get_tree().create_timer(1.5), "timeout")
		get_tree().change_scene("res://Scenes/itemZoom.tscn")
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
