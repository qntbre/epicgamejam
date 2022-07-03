extends Node

var inv = {"Inv1": "10005", "Inv2": "10007", "Inv3": "10031", "Inv4": "0"}
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	setup()
	pass 

func _launch(delta):
	if !$AudioStreamPlayer.playing:
		$AudioStreamPlayer.play()

func setup():
	#Ui.show_on_top()
	GameData.load_data()
	Inventory.create_inv()
	update()
	
func update():
	Inventory.display_inv()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_dayTimer_timeout():
	# On lance la fin de la journee
	pass # Replace with function body.
