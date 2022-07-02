#tool
extends Node2D

var boxInst
var i = 0

func _init():
	boxInst = load("res://Scenes/Box.tscn")

#func _physics_process(delta):
#	if i < 100:
#		var test = boxInst.instance()
#		print("instance ")
#		print(i)
#		test.position = self.get_position()
#		i = i + 1
#		self.get_parent().add_child(test)

func _ready():
	spawnBox()

func spawnBox():
	var parent = self.get_parent()
	var inst = boxInst.instance()
	inst.position = self.get_position()
	call_deferred("add_child", inst)
	print("samarsh")

func _on_Area2D_area_entered(area):
	spawnBox()

#func _on_Timer_timeout():
	#var test = boxInst.instance()
	#test.position = self.get_position()
	#self.get_parent().add_child(test)
