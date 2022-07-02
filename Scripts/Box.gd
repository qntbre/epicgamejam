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
	
func _on_area2D_area_entered(area):
	print("Box hit")
	self.queue_free()

func _physics_process(delta):
	self.position += Vector2(speed, 0)
