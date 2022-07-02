#tool
extends Node2D

var boxes = ["BigBox.tscn", "Box.tscn"]

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
	spawnBox(rdmPosInt(boxes.size()))

func spawnBox(id):
	#var instanceId = randi()%boxes.size()
	var boxScene = load("res://Scenes/Boxes/" + boxes[id])
	var parent = self.get_parent()
	var inst = boxScene.instance()
	inst.position = self.get_position()
	call_deferred("add_child", inst)
	print("Box spawned")

func _on_Area2D_area_entered(area):
	spawnBox(rdmPosInt(boxes.size()))

#func _on_Timer_timeout():
	#var test = boxInst.instance()
	#test.position = self.get_position()
	#self.get_parent().add_child(test)
