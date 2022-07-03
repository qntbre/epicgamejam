#tool
extends Node2D
 
export var ts = false
export var firstPart = true

#func _physics_process(delta):
#	if i < 100:
#		var test = boxInst.instance()
#		print("instance ")
#		print(i)
#		test.position = self.get_position()
#		i = i + 1
#		self.get_parent().add_child(test)

func rdmPosInt(maxi):
	return randi()%maxi

func _ready():
	var texture
	GameData.chosenBox = GameData.rng_box()
	if GameData.boxes[str(GameData.chosenBox)]["Texture"] == "hard1":
		GameData.boxTexture = load("res://Assets/tear_box.png")
	elif GameData.boxes[str(GameData.chosenBox)]["Texture"] == "hard2":
		GameData.boxTexture = load("res://Assets/box1.png")
	else:
		GameData.boxTexture = load("res://Assets/Boxes/" + GameData.boxes[str(GameData.chosenBox)]["Texture"])
	if firstPart == true:
		spawnBox()
	else :
		spawnMidBox()

func spawnBox():
	if not ts :
		$boxSprite.set_texture(GameData.boxTexture)
	else :
		var text = load("res://Assets/downBadBox.png")
		$boxSprite.set_texture(text)
	print("Box spawned")

func spawnMidBox():
	var texture = load("res://Assets/Boxes/" + GameData.boxes[str(GameData.chosenBox)]["Texture"])
	$boxSprite.set_texture(texture)
	#call_deferred("add_child", inst)
	print("Mid box spawned")

func _on_Area2D_area_entered(area):
	print("entered area2d")
	#spawnBox(rdmPosInt(boxes.size()))
	pass

#func _on_Timer_timeout():
	#var test = boxInst.instance()
	#test.position = self.get_position()
	#self.get_parent().add_child(test)
