extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Inventory.do_show()
	$anyBox.set_texture(GameData.boxTexture)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_DoNotOpen_pressed():
	Inventory.do_hide()
	get_tree().change_scene("res://Scenes/MainScene2.tscn")
	pass # Replace with function body.
