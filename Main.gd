extends Node2D
onready var lb = get_node("/root/lastBox")

func _ready():
	if lb.MAX_TOTAL_DELTA < lb.currentDelta :
		get_tree().change_scene("res://Scenes/LoseScreen.tscn")
	if lb.nbrOpened == 5 :
		get_tree().change_scene("res://Scenes/WinScreen.tscn")
