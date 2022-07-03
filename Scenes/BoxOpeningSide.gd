extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var selected
var finished = false
var open1 = preload("../Assets/box_vert_open1.png")
var ori = preload("../Assets/tear_box.png")
var open2 = preload("../Assets/box_vert_open2.png")
var open3 = preload("../Assets/box_vert_open3.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	Inventory.start_hide()
	Inventory.do_show()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		$Particles2D.emitting = true
		selected = true

func _physics_process(delta):
	if selected:
		$Particles2D.position = get_global_mouse_position()
		print("On est down bad")

func _input(event):
	if event is InputEventMouseButton:
		$Particles2D.emitting = false
		if event.button_index == BUTTON_LEFT and not event.pressed and not finished:
			get_parent().set_texture(ori)
			selected = false

func _on_endPoint_input_event(viewport, event, shape_idx):
	if selected:
		#$AnimationPlayer.play("openBox")
		finished = true
		yield(get_tree().create_timer(1.5), "timeout")
		get_tree().change_scene("res://Scenes/itemZoom.tscn")

func _on_upGood_mouse_exited():
	$Particles2D.emitting = false
	if selected and not finished:
		get_parent().set_texture(ori)
		selected = false

func _on_firstOpenUpdate_mouse_entered():
	if selected:
		get_parent().set_texture(open1)
	pass # Replace with function body.


func _on_secondOpenUpdate_mouse_entered():
	if selected:
		get_parent().set_texture(open2)
	pass # Replace with function body.

func _on_thirdOpenUpdate_mouse_entered():
	if selected:
		get_parent().set_texture(open3)
	pass # Replace with function body.



