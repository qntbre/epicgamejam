#tool
extends Node2D

export (float) var speed = 3

var lastBox = null

func _ready():
	lastBox = get_node("/root/lastBox")

func _on_area2D_area_entered(area):
	#globals.savedMainScene = get_tree().get_current_scene()
	randomize()
	lastBox.boxType = randi()%3
	print(lastBox.boxType)
	get_tree().change_scene("res://Scenes/boxChoice.tscn")
	#ref.paused = false

func _physics_process(delta):
	self.position += Vector2(speed, 0)

func _on_VisibilityNotifier2D_screen_exited():
	self.queue_free()


func _on_area2D2_area_entered(area):
	if area.name == "OpenSceneTrigger":
		get_tree().change_scene("res://Scenes/boxChoice.tscn")
