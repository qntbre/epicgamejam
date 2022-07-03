extends CanvasLayer

var lb = null

func _ready():
	GameData.chosenItem = str(GameData.rng_item())
	get_node("../Balance/Label").set_text("%s  kg" % [str(GameData.items[GameData.chosenItem]["Weight"])])
	lb = get_node("/root/lastBox")
	Inventory.do_hide()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Open_pressed():
	$Open.hide()
	$DoNotOpen.hide()
	$AnimationPlayer.play("fade_to_white")
	lb.opened = 1
	yield(get_tree().create_timer(1.4), "timeout")
	get_tree().change_scene("res://Scenes/BoxOpeningSide.tscn")

func _on_DoNotOpen_pressed():
	$Open.hide()
	$DoNotOpen.hide()
	lb.opened = 0
	get_tree().change_scene("res://Scenes/mainScene2.tscn")
