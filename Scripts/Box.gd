#tool
extends Node2D

export (float) var speed = 0.2

# Declare member variables here. Examples:
# var a = 2

func _ready():
	pass
	#update()
	#Make instance
	#var GrabedInstance = boxRes
	#You could now make changes to the new instance if you wanted
	#CurrentEntry.name = "SmokeA"
	#Attach it to the tree

#func setBoxOpen(name) :


func _on_area2D_area_entered(area):
	if area.name == "killBoxTrigger" :
		self.queue_free()
	else :
		print("trigger")

func _physics_process(delta):
	self.position += Vector2(speed, 0)
