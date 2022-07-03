extends TextureRect



func get_drag_data(_position):
	var data = {}
	
	print(self.name)
	
	if (self.name != "0"):
		
		data["origin"] = self
		data["id2"] = self.name
		
		var drag_texture = TextureRect.new()
		drag_texture.expand = true
		drag_texture.texture = texture
		drag_texture.rect_size = Vector2(100, 100)
		
		var control = Control.new()
		control.add_child(drag_texture)
		drag_texture.rect_position = -0.5 * drag_texture.rect_size
		set_drag_preview(control)
	
	return (data)

func can_drop_data(_position, _data):
	return (true)
	
func drop_data(_position, data):
	#texture = data["texture"]
	if ("id" in data.keys()):
		if (Player.inv[str(self.get_parent().name)] == "0"):
			Player.inv[str(self.get_parent().name)] = data["id"]
			Player.update()
			
			data["origin"].texture = null
			data["origin"].name = "0"
		else:
			var old = Player.inv[str(self.get_parent().name)]
			Player.inv[str(self.get_parent().name)] = data["id"]
			Player.update()
			
			data["origin"].texture = load("res://Assets/Items/" + GameData.items[old]["Image"])
			data["origin"].name = old
			
	elif ("id2" in data.keys()):
		if (Player.inv[str(self.get_parent().name)] == "0"):
			Player.inv[str(self.get_parent().name)] = data["id2"]
			
			Player.inv[data["origin"].get_parent().name] = "0"
			
			Player.update()
		else:
			var old = Player.inv[str(self.get_parent().name)]
			Player.inv[str(self.get_parent().name)] = data["id2"]
			
			Player.inv[str(self.get_parent().name)] = data["id2"]
			
			Player.inv[data["origin"].get_parent().name] = old
			
			Player.update()
	pass


func _on_Icon_mouse_entered():
	if (self.name != "0"):
		Inventory.display_infos(self.name)
	pass # Replace with function body.


func _on_Icon_mouse_exited():
	if (self.name != "0"):
		Inventory.display_infos("0")
	pass # Replace with function body.
