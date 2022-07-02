extends CanvasLayer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Inventory.hide()
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Open_pressed():
	$Open.hide()
	$DoNotOpen.hide()
	$AnimationPlayer.play("fade_to_white")
	yield(get_tree().create_timer(1.4), "timeout")
	get_tree().change_scene("res://Scenes/BoxOpeningSide.tscn")

func _on_DoNotOpen_pressed():
	$Open.hide()
	$DoNotOpen.hide()
	get_tree().change_scene("res://Scenes/BoxSpawner.tscn")
	pass # Replace with function body.
