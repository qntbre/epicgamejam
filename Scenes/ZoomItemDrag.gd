extends TextureRect



func get_drag_data(_position):
	var data = {}

	data["id"] = self.name
	data["origin"] = self
	#data["texture"] = texture
	
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
	print(data)
	if ("id2" in data.keys() and self.name == "0"):
		self.texture = data["origin"].texture
		self.name = data["id2"]
	
		print(data["origin"].get_parent().name)
		
		Player.inv[str(data["origin"].get_parent().name)] = "0"
		Player.update()
	pass


	if (self.name != "0"):
		Inventory.display_infos(self.name)
	
	pass # Replace with function body.


func _on_Element_mouse_exited():
	if (self.name != "0"):
		Inventory.display_infos("0")
	pass # Replace with function body.
