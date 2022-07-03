extends TextureRect



func get_drag_data(position):
	var data = {}
	
	
	var drag_texture = TextureRect.new()
	drag_texture.expand = true
	drag_texture.texture = texture
	drag_texture.rect_size = Vector2(100, 100)
	
	var control = Control.new()
	control.add_child(drag_texture)
	drag_texture.rect_position = -0.5 * drag_texture.rect_size
	set_drag_preview(control)
	
	return (data)

func can_drop_data(position, data):
	return (true)
	
func drop_data(position, data):
	#texture = data["texture"]
	if("id" in data.keys()):
		Player.inv[str(self.get_parent().name)] = data["id"]
		Player.update()
	pass


func _on_Icon_mouse_entered():
	Inventory.display_infos(self.name)
	pass # Replace with function body.


func _on_Icon_mouse_exited():
	Inventory.display_infos("0")
	pass # Replace with function body.
