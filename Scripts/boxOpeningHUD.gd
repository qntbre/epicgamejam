extends CanvasLayer

var lb = null

func _ready():
	get_node("../Balance/AnimatedSprite").set_texture(GameData.boxTexture)
	GameData.chosenItem = str(GameData.rng_item())
	get_node("../Balance/Label").set_text("%s  kg" % [str(GameData.items[GameData.chosenItem]["Weight"])])
	lb = get_node("/root/lastBox")
	Inventory.do_hide()

func _on_Open_pressed():
	$Open.hide()
	$DoNotOpen.hide()
	$AnimationPlayer.play("fade_to_white")
	lb.opened = 1
	print("nbr opened")
	print(lb.nbrOpened)
	yield(get_tree().create_timer(1.4), "timeout")
	if GameData.boxes[str(GameData.chosenBox)]["Texture"] == "hard1":
		get_tree().change_scene("res://Scenes/BoxOpeningSide.tscn")
	elif GameData.boxes[str(GameData.chosenBox)]["Texture"] == "hard2":
		get_tree().change_scene("res://Scenes/BoxOpeningTop.tscn")
	else:
		get_tree().change_scene("res://Scenes/defaultScene.tscn")
	

func _on_DoNotOpen_pressed():
	$Open.hide()
	$DoNotOpen.hide()
	lb.opened = 0
	get_tree().change_scene("res://Scenes/mainScene2.tscn")
