extends CanvasLayer

var lb = null

func _ready():
	lb = get_node("/root/lastBox")

func _on_Open_pressed():
	$Open.hide()
	$DoNotOpen.hide()
	$AnimationPlayer.play("fade_to_white")
	lb.opened = true
	yield(get_tree().create_timer(1.4), "timeout")
	get_tree().change_scene("res://Scenes/itemZoom.tscn")

func _on_DoNotOpen_pressed():
	$Open.hide()
	$DoNotOpen.hide()
	lb.opened = false
	get_tree().change_scene("res://Scenes/mainScene2.tscn")
