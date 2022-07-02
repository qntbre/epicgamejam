#tool
extends Node2D
 
var boxes = ["BigBox.tscn", "Box.tscn"]
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
	if firstPart == true:
		spawnBox(rdmPosInt(boxes.size()))
	else :
		spawnMidBox()

func spawnBox(id):
	#var instanceId = randi()%boxes.size()
	var boxScene
	if not ts :
		boxScene = load("res://Scenes/Boxes/" + boxes[id])
	else :
		boxScene = load("res://Scenes/Boxes/downBadBox.tscn");
	var parent = self.get_parent()
	var inst = boxScene.instance()
	inst.position = self.get_position()
	call_deferred("add_child", inst)
	print("Box spawned")

func spawnMidBox():
	var boxScene = load("res://Scenes/Boxes/" + boxes[0])
	var parent = self.get_parent()
	var inst = boxScene.instance()
	inst.position = self.get_position() + Vector2(500, 0)
	#call_deferred("add_child", inst)
	print("Mid box spawned")

func _on_Area2D_area_entered(area):
	print("entered area2d")
	spawnBox(rdmPosInt(boxes.size()))
	pass

#func _on_Timer_timeout():
	#var test = boxInst.instance()
	#test.position = self.get_position()
	#self.get_parent().add_child(test)
