extends Node2D

@export var SPEED = 400

var input = Vector2.ZERO
var screen_size # Size of the game window
var paddle_half_width

func get_input():
	input.x = int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left"))
	return input.normalized()

func movement(delta):
	input = get_input()
	
	var new_position = position + input * SPEED * delta
	new_position.x = clamp(new_position.x, paddle_half_width, screen_size.x - paddle_half_width)
	position = new_position
	

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	#print(screen_size)
	paddle_half_width = $Sprite2D.get_texture().get_width() / 2


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	movement(delta)
