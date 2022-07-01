#tool
extends Node2D

onready var boxInst = load("res://Scenes/Box.tscn")

func _on_Timer_timeout():
	var test = boxInst.instance()
	test.position = self.get_position()
	self.get_parent().add_child(test)
