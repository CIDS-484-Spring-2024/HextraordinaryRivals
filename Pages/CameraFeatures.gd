#BUG: zooming in leaves the in game menu behind. Not fatal but annoying

extends Camera2D

#I unfortunately do not recall what video I retrieved this from, as it was quite a while ago
#and I did not mark it down

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var minZoom: float = 1.0
var maxZoom: float = 2.0
var zoomSpeed: float = 0.05
var dragSensitivity: float = 1.0


#effectively gives the same relative camera movement based on how zoomed in you are on the scene
#also changes the amount of zoom that can be achieved based on how zoomed in you are on the scene
func _input(event): 
	if event is InputEventMouseMotion and Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
		position -= event.relative * dragSensitivity / zoom
	
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			zoom += Vector2(zoomSpeed, zoomSpeed)
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			zoom -= Vector2(zoomSpeed, zoomSpeed)
		zoom = clamp(zoom, Vector2(minZoom, minZoom), Vector2(maxZoom, maxZoom))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
