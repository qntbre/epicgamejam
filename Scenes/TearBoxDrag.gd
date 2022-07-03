extends TextureRect




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

