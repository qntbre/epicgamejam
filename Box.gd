extends RigidBody2D
var mouse_button_pressed

var followLine = 5
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			mouse_button_pressed = 1
		elif Input.is_action_just_released("click"):
			mouse_button_pressed = 0
	#	print("Left mouse button released.")
	#elif event.button_index == BUTTON_LEFT and event. :
	#	mouse_button_pressed = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if mouse_button_pressed:
		print("Le bouton est pressed")

func _on_Box_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
			if event.button_index == BUTTON_LEFT and event.pressed:
				print("clicked")
