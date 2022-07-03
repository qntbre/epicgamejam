extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var selected
var finished = 0
var ori = preload("../Assets/box1.png")
var open1 = preload("../Assets/box_open1.png")
var open2 = preload("../Assets/box_open2.png")
var open3 = preload("../Assets/box_open3.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	Inventory.start_hide()
	Inventory.do_show()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass


#func _on_Area2D_input_event(viewport, event, shape_idx):
#	if Input.is_action_just_pressed("click"):
#		print("On est vraiment down bad")
#		$Particles2D.emitting = true
#		selected = true

func _physics_process(delta):
	if selected:
		$Particles2D.position = get_global_mouse_position()
		print("On est down bad")

func _input(event):
	if event is InputEventMouseButton:
		$Particles2D.emitting = false
		if event.button_index == BUTTON_LEFT and not event.pressed and not finished:
			get_node("../../Box1").set_texture(ori)
			selected = false

func _on_endPoint_input_event(viewport, event, shape_idx):
	if selected:
		finished = 1
		$AnimationPlayer.play("openBox")
		yield(get_tree().create_timer(1.5), "timeout")
		get_tree().change_scene("res://Scenes/itemZoom.tscn")

func _on_upGood_mouse_exited():
	if selected and not finished:
		$Particles2D.emitting = false
		get_node("../../Box1").set_texture(ori)
		selected = false


func _on_firstOpenUpdate_mouse_entered():
	if selected:
		get_node("../../Box1").set_texture(open1)


func _on_secondOpenUpdate_mouse_entered():
	if selected:
		get_node("../../Box1").set_texture(open2)


func _on_thirdOpenUpdate_mouse_entered():
	if selected:
		get_node("../../Box1").set_texture(open3)


func _on_startingPoint2_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		print("On est vraiment down bad")
		$Particles2D.emitting = true
		selected = true
